//
//  ViewController.swift
//  Class_Roster
//
//  Created by schwenk on 11/8/14.
//  Copyright (c) 2014 schwenk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var names = [Person]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loadFromPlist()
        self.tableView.dataSource = self
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func loadFromPlist() {
        let plistURL = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist")
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let first = personDictionary["First Name"] as String
                let last = personDictionary["Last Name"] as String
                var person = Person(firstName: first, lastName: last, isStudent: true)
                self.names.append(person)
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell
        
        var personToDisplay = self.names[indexPath.row]
        cell.nameLabel.text = personToDisplay.myFullName()
        cell.studentLabel.text = "student"
        cell.personImageView.backgroundColor = UIColor.grayColor()
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.names[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
        }
    }
}
