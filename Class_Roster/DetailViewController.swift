
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameField.delegate = self
        self.lastNameField.delegate = self
        self.title = self.selectedPerson.myFullName()
        //self.firstNameLabel.text = self.selectedPerson.myFirstName()
        //self.lastNameLabel.text = self.selectedPerson.myLastName()
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    var selectedPerson = Person(firstName: "", lastName: "", isStudent: false)
    

    @IBAction func camerButtonPressed(sender: AnyObject) {
        
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
        self.imageView.image = image
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        
        selectedPerson.studentPic = image
    }
    
    

}
