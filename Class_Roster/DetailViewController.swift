
//
//  DetailViewController.swift
//  Class_Roster
//
//  Created by schwenk on 11/8/14.
//  Copyright (c) 2014 schwenk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var selectedPerson = Person(firstName: "", lastName: "", isStudent: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.myFullName()
        self.firstNameLabel.text = self.selectedPerson.myFirstName()
        self.lastNameLabel.text = self.selectedPerson.myLastName()
    }

}
