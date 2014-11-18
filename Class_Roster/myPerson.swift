//
//  myPerson.swift
//  Class_Roster
//
//  Created by schwenk on 11/8/14.
//  Copyright (c) 2014 schwenk. All rights reserved.
//

import Foundation
import UIKit

class Person {
    
    var firstName : String
    var lastName : String
    var isStudent : Bool
    var studentPic : UIImage?
    
    init(firstName: String, lastName: String, isStudent: Bool){
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }
    
    func myFirstName() -> String{
        return self.firstName
    }
    
    func myLastName() -> String{
        return self.lastName
    }
    
    func myFullName() -> String{
        return self.firstName+" "+self.lastName
    }
}