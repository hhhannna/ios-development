//
//  ViewController.swift
//  TableViewExercise
//
//  Created by Heikki Latvala on 29/05/2019.
//  Copyright © 2019 m9138. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var employees = [
        "Blisse Mingasson","Huey Ranns","Verge Burfield","Francklyn Marquet","Pamela Sansun",
        "Clemmie Craghead","Gunther Kenchington","Faina Rawet","Sosanna Hayworth","Dyana Deedes"
    ]
    var phones = ["587-675-8141","887-451-1741","712-915-2597","468-594-8478","162-892-4315",
                  "889-843-1785","232-979-3191","993-828-7705","565-655-0804","174-964-0802"
    ]
    
    var emails = ["Blisse.Mingasson@company.com","Huey.Ranns@company.com","Verge.Burfield@company.com","Francklyn.Marquet@company.com","Pamela.Sansun@company.com","Clemmie.Craghead@company.com","Gunther.Kenchington@company.com","Faina.Rawet@company.com","Sosanna.Hayworth@company.com","Dyana.Deedes@company.com"
    ]
    // handle cell deletion when swiped left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            employees.remove(at: indexPath.row)
            phones.remove(at: indexPath.row)
            emails.remove(at: indexPath.row)
        }
        // refresh TableView data
        tableView.deleteRows(at: [indexPath], with: .fade) // .right, .left or .top
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "Cell"
        // get the current row and create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // modify cell data
        cell.textLabel?.text = employees[indexPath.row]
        // modify cell data
        cell.imageView?.image = UIImage(named: "employee\(indexPath.row+1)")
        
        // return cell
        return cell
    }
    // handle cell selection, open an options menu
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // add a new option menu
        let optionMenu = UIAlertController(title: nil, message:"What do you want to do?", preferredStyle: .actionSheet)
        // create callActionHandler object
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            if let url = URL(string: "tel://\(self.phones[indexPath.row])") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
        
        // create emailActionHandler object
        let emailActionHandler = { (action:UIAlertAction!) -> Void in
            if let url = URL(string: "mailto:\(self.emails[indexPath.row])") {
                print("url=\(url)")
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        // create webActionHandler object
        let webActionHandler = { (action:UIAlertAction!) -> Void in
            if let url = URL(string: "http://company.com") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
        // add action to menu
        let webAction = UIAlertAction(title: "Web", style: .default, handler: webActionHandler)
        optionMenu.addAction(webAction)
        // add action to menu
        let emailAction = UIAlertAction(title: "Email", style: .default, handler: emailActionHandler)
        optionMenu.addAction(emailAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        optionMenu.addAction(cancelAction)

        let callAction = UIAlertAction(title: "Call", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        // show menu
        present(optionMenu, animated: true, completion: nil)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

