
import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var courses = [Course]()
    
    // the map view needs an annotation view
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // indentifier
        let identifier = "CourseMarker"
        
        // don't modify user location annotation
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        // reuse the annotation if possible
        var annotationView: CourseMarkerView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? CourseMarkerView
        
        // if we can't reuse, create a new one
        if annotationView == nil {
            annotationView = CourseMarkerView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        // return annotation view
        return annotationView
    } 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // define delegates to mapview (in this class)
        mapView.delegate = self
        
        parseJSON()
        
    }

    func parseJSON() {
        
        let urlString = "http://ptm.fi/data/golf_courses_ios.json"
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
            // decode JSON data
            let decoder = JSONDecoder()
            do {
                // decode employees
                self.courses = try decoder.decode([Course].self, from: data)
                // show employee annotations
                DispatchQueue.main.async {
                    
                    self.mapView.addAnnotations(self.courses)
                }
            } catch let error {
                print(error)
            }
            
            }.resume() // start task}
    }
}

class Course: NSObject, MKAnnotation, Codable {
    // for annotation
    let coordinate: CLLocationCoordinate2D
    var title: String? { return course }
    
    // for employee
    let course: String
    let image: String
    let type: String
    let address: String
    let phone: String
    let email: String
    let web: String
    let text: String
    
    public init(coordinate: CLLocationCoordinate2D, course: String, image: String, type: String, address: String, phone: String, email: String, web: String, text: String) {
        self.course = course
        self.coordinate = coordinate
        self.image = image
        self.type = type
        self.address = address
        self.phone = phone
        self.email = email
        self.web = web
        self.text = text
    }
}
// create extension for Codable
extension CLLocationCoordinate2D: Codable {
    // encode
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(latitude)
        try container.encode(longitude)
    }
    // decode
    public init(from decoder: Decoder) throws {
        self.init()
        var container = try decoder.unkeyedContainer()
        latitude = try container.decode(Double.self)
        longitude = try container.decode(Double.self)
    }
    
}

class CourseMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let Course = newValue as? Course else { return }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: 0, y: 0)
            
            let customView = UIView()
            let views = ["customView": customView]
            customView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[customView(350)]", options: [], metrics: nil, views: views))
            customView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[customView(200)]", options: [], metrics: nil, views: views))
            let textView = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 200))
            textView.font = textView.font.withSize(12)
            textView.numberOfLines = 0
            textView.text = Course.address + "\n" + Course.phone + "\n" + Course.email + "\n" + Course.web + "\n\n" + Course.text
            
            customView.addSubview(textView)
            
            detailCalloutAccessoryView = customView
            
            
            if (Course.type == "Kulta") {
                markerTintColor = UIColor.yellow
            }
            else if (Course.type == "Kulta/Etu") {
                markerTintColor = UIColor.green
            }
            else if (Course.type == "Etu") {
                markerTintColor = UIColor.blue
            }
            else if (Course.type == "?") {
                markerTintColor = UIColor.purple
            }
            else {
                markerTintColor = UIColor.red
            }
            
           
        
             glyphText = String(Course.type)
        }
        
    }

    
}
