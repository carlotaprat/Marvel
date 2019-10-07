

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.imageView.setAnchorPoint(point: CGPoint(x: 0.0, y: 1.0))

        UIView.animate(withDuration: 2.5, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.imageView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        }, completion: { (true) in
            self.performSegue(withIdentifier: "mainsegue", sender: self)
        })
    }

}
