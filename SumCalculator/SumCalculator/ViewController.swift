

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var result2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonClicked(_ sender: Any) {
        var text1: String = number1.text!
        var text2: String = number2.text!
        var res: Int = 0
        
        if let num1 = Int(text1) {
            
            if let num2 = Int(text2) {
            res = num1 + num2
        }
        
    }
    result2.text = "\(res)"
}
}
