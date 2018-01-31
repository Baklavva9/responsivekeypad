//
//  ViewController.swift
//  keyboardstack
//
//  Created by Izati Ng on 3/1/18.
//  Copyright © 2018 bklv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var outerStackViewTopConstraint: NSLayoutConstraint!
    
    var outerStackViewTopConstraintConstant: CGFloat = 250.0
    
    @IBOutlet var  textFieldStackView: UIStackView!
    @IBOutlet var outerStackView: UIStackView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var activetextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
     //    self.outerStackViewTopConstraint.constant = self.outerStackViewTopConstraintConstant
        self.outerStackViewTopConstraint.constant = 150
        
    
    // putting the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
    }
        
  //   MARK: - Text Field Methods

    func textFieldDidBeginEditing(_ textField: UITextField) {

        activetextField = textField
        
//        if self.activetextField == nameField {
//
//            self.outerStackViewTopConstraint.constant = 150
//        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {


      //  self.outerStackViewTopConstraint.constant = self.outerStackViewTopConstraintConstant
           self.outerStackViewTopConstraint.constant = 150
            self.view.layoutIfNeeded()
        })
        
        return true
    }
    
    // MARK: - User touches screen (outside of keypad) to dismiss kaypad
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            
            
    //    self.outerStackViewTopConstraint.constant = self.outerStackViewTopConstraintConstant
           self.outerStackViewTopConstraint.constant = 150
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let info = notification.userInfo {
            
//            activetextField = nameField2
//            activetextField = emailField
//            activetextField = passwordField
            
            let rect:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            
            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.25, animations: {
                
                if self.activetextField == self.passwordField {
                    
                    self.outerStackViewTopConstraint.constant = 70
                }
                
                
                if self.activetextField == self.emailField {
                
                self.outerStackViewTopConstraint.constant = 110
                
                }
                
    //        self.outerStackViewTopConstraint.constant = 70
            self.view.layoutIfNeeded()
            
            })
            
        }
 }
}
