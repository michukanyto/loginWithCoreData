//
//  RegistrationViewController.swift
//  NewLogin
//
//  Created by Marlon Escobar on 2019-04-30.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController{
    
    var users = [User]()
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
       
        //making validations
        guard let email = userEmailTextField.text,  email != "" else {
            displayMessage(message: "Empty user name")
            return
        }
        guard let password = userPasswordTextField.text,  password != "",
        let repeatPassword = userRepeatPasswordTextField.text, repeatPassword == password else {
            displayMessage(message: "Empty password or passwords don't match")
            return
        }
        //Saving data
        let user = User(context: PersistenceService.context)
        user.email = email
        user.password = password
        PersistenceService.saveContext()
        self.users.append(user)

        displayMessage(message: "Registration is successful !")
        print(user.email)
        print(user.password)

    }
    
    
    func displayMessage(message:String){
        let myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(action)
        self.present(myAlert,animated: true,completion: nil)
        
    }
}
