
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getVideo(videoCode: "72NfSwCzFVE")
    }
    
    func getVideo(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        myWebView.loadRequest(URLRequest(url: url!))
    }
}

