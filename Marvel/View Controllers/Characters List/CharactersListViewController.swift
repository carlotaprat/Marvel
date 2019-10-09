import UIKit

class CharactersListViewController: UIViewController, ServiceAlertProtocol {

    @IBOutlet weak var searchBar: CustomSearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noResultsView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CharactersListViewModel = CharactersListViewModel()
    let apiService: CharactersDataService = CharactersAPIService()
    var searchText: String = ""
    var refreshController = UIRefreshControl()
    let itemsPerRow: CGFloat = 3
    let itemsInset: CGFloat = 10
    let heightConstant: CGFloat = 2
    let minimumInterimSpacing: CGFloat = 0
    let extraSpace: CGFloat = 1
    let delayFetchOnSearch: Double = 0.5
    let characterCellId = "CharactersListCell"
    let characterDetailName = "CharacterDetailVC"
    let storyboardName = "Main"
    let pagingConstant = 6
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchCharacters()
    }
    
    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.collectionViewLayout = createLayout()
        refreshController.tintColor = UIColor.MarvelDark
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.refreshControl = refreshController
        self.searchText = searchBar.text ?? ""
        searchBar.delegate = self as UISearchBarDelegate
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.size.width - ((itemsPerRow + extraSpace) * itemsInset)) / itemsPerRow
        layout.itemSize = CGSize(width: width, height: heightConstant * width)
        layout.sectionInset = UIEdgeInsets(top: itemsInset, left: itemsInset, bottom: itemsInset, right: itemsInset)
        layout.minimumInteritemSpacing = minimumInterimSpacing
        return layout
    }
    
    func fetchCharacters() {
        showLoading()
        viewModel.fetchCharacters(searchText: searchText, onSuccess: { _ in
            self.collectionView.reloadData()
            self.finishLoading()
            
        }, onError: { error in
            AlertHelper.app.showAlert(error: error, vc: self)
            self.finishLoading()
        })
    }
    
    func finishLoading() {
        self.activityIndicator.stopAnimating()
        self.refreshController.endRefreshing()
        self.activityIndicator.isHidden = true
        self.noResultsView.isHidden = self.viewModel.getCharactersCount() != 0
    }
    
    func showLoading() {
        if refreshController.isRefreshing {
            activityIndicator.isHidden = true
        } else {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
    }
    
    @objc func reload() {
        viewModel.resetPagination()
        self.searchText = searchBar.text ?? ""
        self.fetchCharacters()
    }
    
    @objc func refresh() {
        viewModel.resetPagination()
        collectionView.reloadData()
        self.searchText = ""
        self.fetchCharacters()
    }
    
    @objc func hideKeyboard() {
        self.searchBar.endEditing(true)
    }

}
