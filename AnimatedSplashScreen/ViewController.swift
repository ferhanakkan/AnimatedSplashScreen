

import UIKit
import SwiftyGif

class ViewController: UIViewController, SwiftyGifDelegate  {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var appcentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.delegate = self

        do {
            let gif = try UIImage(gifName: "logoGif.gif")
            setLabelsHiddenAnimation()
            self.logoImageView.setGifImage(gif, loopCount: 1)
        } catch {
            print(error)
        }
    }
    
    func setLabelsHiddenAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.appcentLabel.alpha = 0
        } completion: { (_) in
            self.setLabelsShowAnimation()
        }
    }
    
    func setLabelsShowAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.appcentLabel.alpha = 1
        } completion: { (_) in
            self.setLabelsHiddenAnimation()
        }
    }

    func gifDidStop(sender: UIImageView) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HelloVC")
        self.view.window?.rootViewController = vc
    }

}

