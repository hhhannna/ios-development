//
//  ViewController.swift
//  NavigationControllerExercise
//
//  Created by Heikki Latvala on 30/05/2019.
//  Copyright © 2019 m9138. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let SegueEmployeeDetailViewController = "SegueEmployeeDetailViewController"
    @IBOutlet weak var tableView: UITableView!
    
    let employees = [
        "Blisse Mingasson","Huey Ranns","Verge Burfield","Francklyn Marquet","Pamela Sansun",
        "Clemmie Craghead","Gunther Kenchington","Faina Rawet","Sosanna Hayworth","Dyana Deedes",
        "Mohammad Brisk", "Daniel Duns", "Mike Morgan", "Julius Jams", "Kristen Ohlsen", "Peter Banks",
        "Mike Morris", "Jean Julk", "Minni Monni", "Peter Bunks"
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // our cell layout identifier
        let cellIdentifier: String = "Cell"
        // get the current row and create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // modify cell data
        cell.textLabel?.text = employees[indexPath.row]
        
        // return cell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // perform Segue
        performSegue(withIdentifier: SegueEmployeeDetailViewController, sender: self)
        // remove selection from table view
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // do a preparation before navigation, pass employee name to EmployeeDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // going toSegueEmployeeDetailViewController
        if segue.identifier == SegueEmployeeDetailViewController {
            // get table view selected row index
            if let indexPath = tableView.indexPathForSelectedRow {
                // downcast UIViewController to EmployeeDetailViewController
                let destinationViewController = segue.destination as! EmployeeDetailViewController
                // set employeeName variable from employees collection
                destinationViewController.employeeName = employees[indexPath.row]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Employees"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
