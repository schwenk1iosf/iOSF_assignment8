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
        self.tableView.dataSource = self
        
        var p1 = Person(firstName: "Alfred", lastName: "Bester", isStudent: true)
        var p2 = Person(firstName: "Greg", lastName: "Egan", isStudent: true)
        var p3 = Person(firstName: "Arthur", lastName: "Clarke", isStudent: true)
        
        self.names.append(p1)
        self.names.append(p2)
        self.names.append(p3)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var personToDisplay = self.names[indexPath.row]
        cell.textLabel.text = personToDisplay.myFullName()
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
