

import UIKit

class ViewController: UIViewController {

var firstnames: [String] = ["Renato", "Rosangela", "Tim", "Bartol", "Jeannette", "Franka", "Valter", "Garnett", "Hyan", "Jasper"]
var lastnames: [String] = ["Yogurt", "Simsala", "Juubag", "Smith", "Frank", "Paddington", "Waterlily", "Lighthouse", "Sherlok", "Bass"]
var jobtitles: [String] = ["Salesman", "Coder", "CEO", "Cleaner", "Rap-Artist", "Bus driver", "Cook", "Acrobat", "Pilot", "Pro Gamer"]
var infos: [String] = [
    "Renato is salesman in a huge market. He loves pineapple and goes skiing in the winter.",
    "Rosangela loves food and hates to exercise. She is a coder at Google and hates it.",
    "Tim loves to keep everything organized, maybe that is why he loves his job as a CEO.",
    "Bartol misses his dog Stanley and is in deep depression. His work as a cleaner makes him happy and brings joy.",
    "Jeannette is creative, fun and addicted to baseball. You can see her perform in almost any game. Go Redhawks go!",
    "Franka loves ketchup and offer it free in her bus number 7. You can spot her driving happily a cross New York city telling tourists fake facts about the city.",
    "Valter has no thumb. As a professional cook in mc donalds, he gets stared quite a bit. His hamburgers are the best in the city, go taste them!",
    "Garnett is as flexible as a snake. He preforms in the circus and gets the bills payed.",
    "Hyan is not afraid of the heights. From Paris to Berlin, he will get you safely to the ground.",
    "Jasper is rarely seen anywhere. As a pro gamer, he sits on the computer practising almost 12h per day. He is the world leader in Hayday!"
    ]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fistname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var jobtitle: UILabel!
    @IBOutlet weak var infotext: UITextView!
    
    @IBAction func buttonClicked(_ sender: Any) {
        // get a button which has been tapped
        let button :UIButton = sender as! UIButton
        // get button title
        let buttonTitle :String = button.currentTitle!
        // get it as a number
        let buttonNumber :Int = Int(buttonTitle)!
        // show employee
        showEmployee(index: buttonNumber)
        
    }
    
    func showEmployee(index: Int) {
        // change image
        imageView.image = UIImage(named: "employee\(index)")
        // change texts
        fistname.text = firstnames[index-1]
        lastname.text = lastnames[index-1]
        infotext.text = infos[index-1]
        jobtitle.text = jobtitles[index-1]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showEmployee(index: 1)
    }


}

