
//
//  DetailViewController.swift
//  Class_Roster
//
//  Created by schwenk on 11/8/14.
//  Copyright (c) 2014 schwenk. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePickerController = UIImagePickerController()
    var selectedPerson = Person(firstName: "", lastName: "", isStudent: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameField.delegate = self
        self.lastNameField.delegate = self
        
        // Set the name text fields with the students current name
        self.firstNameField.text = self.selectedPerson.myFirstName()
        self.lastNameField.text = self.selectedPerson.myLastName()
        
        //title for the detail view is set here, and will only change when view is reloaded
        self.title = self.selectedPerson.myFullName()
        
        //this checks whether a student picture has been set for the selected student. If not, the generic image is used
        if selectedPerson.studentPic != nil{
            self.imageView.image = selectedPerson.studentPic
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //the selected persons names are be set to the values in the name text fields
        self.selectedPerson.firstName = self.firstNameField.text
        self.selectedPerson.lastName = self.lastNameField.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func camerButtonPressed(sender: AnyObject) {
        //A camera is checked for first and used as the imagePickerController is present. If not, the photo library is used
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
        else if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        //image on detail contoller is updated here
        self.imageView.image = image
        self.imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        //student image is updated here
        self.selectedPerson.studentPic = image
        
    }
}
