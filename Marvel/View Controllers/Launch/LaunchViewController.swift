import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    let alphaLogoAnimation: CGFloat = 1
    let durationLogoAnimation: Double = 2.0
    let delayLogoAnimation: Double = 0.0
    let scaleLogoAnimation: CGFloat = 2.5
    let durationSpiderAnimation: Double = 1.0
    let delaySpiderAnimation: Double = 0.5
    let translationX: CGFloat = 0.0
    let translationY: CGFloat = 5
    let segueName = "mainsegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: durationLogoAnimation, delay: delayLogoAnimation, options: .curveEaseIn, animations: {
            self.logoImageView.alpha = self.alphaLogoAnimation
            self.logoImageView.transform = CGAffineTransform.init(scaleX: self.scaleLogoAnimation, y: self.scaleLogoAnimation)
        }, completion: { (true) in
            UIView.animate(withDuration: self.durationSpiderAnimation, delay: self.delaySpiderAnimation, options: .curveEaseOut, animations: {
                self.imageView.transform = CGAffineTransform.init(translationX: self.translationX, y: self.imageView.frame.height - self.translationY)
            }, completion: { (true) in
                self.performSegue(withIdentifier: self.segueName, sender: self)
            })
        })
    }
}
