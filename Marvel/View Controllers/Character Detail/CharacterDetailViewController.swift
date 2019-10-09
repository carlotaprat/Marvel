import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicsTitleLabel: UILabel!
    @IBOutlet weak var seriesTitleLabel: UILabel!
    @IBOutlet weak var storiesTitleLabel: UILabel!
    @IBOutlet weak var eventsTitleLabel: UILabel!
    @IBOutlet weak var comicsLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var storiesLabel: UILabel!
    @IBOutlet weak var eventsLabel: UILabel!
    
    var viewModel: CharacterDetailViewModel = CharacterDetailViewModel()

    private let comicsString = "comics"
    private let seriesString = "series"
    private let storiesString = "stories"
    private let eventsString = "events"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        nameLabel.text = viewModel.getName().uppercased()
        descriptionLabel.text = viewModel.getDescription()
        imageView.lowerShadow()
        
        if let url = URL(string: viewModel.getImage()) {
            imageView.kf.setImage(with: url)
        }
        
        comicsTitleLabel.text = comicsString.localized
        seriesTitleLabel.text = seriesString.localized
        storiesTitleLabel.text = storiesString.localized
        eventsTitleLabel.text = eventsString.localized
        
        comicsLabel.text = viewModel.getFormattedArray(feature: .comic)
        seriesLabel.text = viewModel.getFormattedArray(feature: .serie)
        storiesLabel.text = viewModel.getFormattedArray(feature: .story)
        eventsLabel.text = viewModel.getFormattedArray(feature: .event)

    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
