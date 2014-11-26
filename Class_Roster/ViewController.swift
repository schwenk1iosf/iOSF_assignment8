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
    // this person object array will store the students shown in the roster
    var names = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //if keyed archive exists, students are loaded from it. Otherwise load from plist
        if let namesFromArchive = self.loadFromArchive() as [Person]? {
            self.names = namesFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }
        
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime")
        
        if hasLaunched == false {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //reolads tableview and saves changes to archive when this view is loaded
        self.tableView.reloadData()
        //Student array is sorted in place by last name
        self.names.sort({$0.lastName < $1.lastName})
        
        self.saveToArchive()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell
        
        var personToDisplay = self.names[indexPath.row]
        cell.nameLabel.text = personToDisplay.myFullName()
        
        //limited functionality for student status, but included here
        if  personToDisplay.isStudent {
            cell.studentLabel.text = "student"
        } else {
            cell.studentLabel.text = "non-student"
        }
        
        //checks if student image has been set, otherwise uses generic image
        if personToDisplay.myPic() != nil {
            cell.personImageView.image = personToDisplay.studentPic
        }
        
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
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        NSKeyedArchiver.archiveRootObject(self.names, toFile: documentsPath + "/archive1")
    }
    
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let namesFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive1") as? [Person]{
            
            return namesFromArchive
        }
        return nil
    }
}
