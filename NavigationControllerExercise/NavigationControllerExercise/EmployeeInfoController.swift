
import UIKit

struct Dog: Codable {
    var status: String
    var message: String
}

class EmployeeInfoController: UIViewController {
    
    let SegueEmployeeInfoController = "SegueEmployeeInfoController"
    var dogURL = "https://images.dog.ceo/breeds/labrador/n02099712_7775.jpg"

    @IBOutlet weak var EmployeePetImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadAndParseJson()
        
        let url = URL(string: dogURL)
        // load image data
        let imageData = try? Data(contentsOf: url!)
        // show image
        if imageData != nil {
        EmployeePetImage.image = UIImage(data: imageData!)

        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func loadAndParseJson() {
        let urlString = "https://dog.ceo/api/breeds/image/random"
        guard let url = URL(string: urlString) else {
            print("Error: URL error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // do we have any errors
            if error != nil {
                print(error!.localizedDescription)
            }
            // check that we actually have data
            guard let data = data else {
                print("Error: did not receive data")
                return
            }
            // JSON decoding and parsing
            do {
                // decode retrived data with JSONDecoder and assing type of Employee object
                let dogData = try JSONDecoder().decode(Dog.self, from: data)
                // get back to the main queue and assing data to TableView
                DispatchQueue.main.async {
                    print(dogData.message)
                    self.dogURL = dogData.message
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            }.resume() // start task
    }
}
