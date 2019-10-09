import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        }, completion: { (true) in
            UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
                self.imageView.transform = CGAffineTransform.init(translationX: 0.0, y: self.imageView.frame.height - 5)
            }, completion: { (true) in
                self.performSegue(withIdentifier: "mainsegue", sender: self)
            })
        })
    }
}
