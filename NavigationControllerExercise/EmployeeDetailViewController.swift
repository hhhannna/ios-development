

import UIKit

// EmployeeDetailViewController
class EmployeeDetailViewController: UIViewController {
    
    // connection to UIImageView and UILabel
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var employeeLabel: UILabel!
    
    // variable to hold employee name
    var employeeName: String = ""
    
    // viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show employee name
        employeeLabel.text = employeeName;
        
        // load image from url - randomize one image from https://randomuser.me
        var imageString = "https://randomuser.me/api/portraits/";
        let random = arc4random_uniform(2) // 0 or 1
        if (random == 1) {
            imageString += "women/"
        } else {
            imageString += "men/"
        }
        imageString += String(arc4random_uniform(99) + 1) // "1" to "100"
        imageString += ".jpg"
        // create image URL
        let url = URL(string: imageString)
        // load image data
        let imageData = try? Data(contentsOf: url!)
        // show image
        if imageData != nil {
            employeeImageView.image = UIImage(data: imageData!)
            employeeImageView.layer.shadowOpacity = 0.7
            employeeImageView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

