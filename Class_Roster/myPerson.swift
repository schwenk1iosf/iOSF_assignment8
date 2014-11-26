//
//  myPerson.swift
//  Class_Roster
//
//  Created by schwenk on 11/8/14.
//  Copyright (c) 2014 schwenk. All rights reserved.
//


import Foundation
import UIKit

class Person : NSObject, NSCoding {
    //Student properties. Student picture is optional
    var firstName : String
    var lastName : String
    var isStudent : Bool
    var studentPic : UIImage?
    
    init(firstName: String, lastName: String, isStudent: Bool){
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }
    
    //Getter methods for student properties
    func myFirstName() -> String{
        return self.firstName
    }
    func myLastName() -> String{
        return self.lastName
    }
    func myFullName() -> String{
        return self.firstName+" "+self.lastName
    }
    func myPic() -> UIImage?{
        return self.studentPic
    }
    
    // init with coder for loading archived student list
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        self.isStudent = aDecoder.decodeObjectForKey("isStudent") as Bool
        
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage{
            self.studentPic = decodedImage
        }
    }
    //method to encode student object into archive
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.isStudent, forKey: "isStudent")
        
        if self.studentPic != nil {
            aCoder.encodeObject(self.studentPic, forKey: "image")
        }
        else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }
}