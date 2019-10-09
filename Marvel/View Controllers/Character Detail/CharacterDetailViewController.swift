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
        
        comicsTitleLabel.text = NSLocalizedString("comics", comment: "")
        seriesTitleLabel.text = NSLocalizedString("series", comment: "")
        storiesTitleLabel.text = NSLocalizedString("stories", comment: "")
        eventsTitleLabel.text = NSLocalizedString("events", comment: "")
        
        comicsLabel.text = viewModel.getFormattedArray(feature: .comic)
        seriesLabel.text = viewModel.getFormattedArray(feature: .serie)
        storiesLabel.text = viewModel.getFormattedArray(feature: .story)
        eventsLabel.text = viewModel.getFormattedArray(feature: .event)

    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
