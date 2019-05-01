//
//  LoginViewController.swift
//  NewLogin
//
//  Created by Marlon Escobar on 2019-04-30.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    var users = [User]()

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
                let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
                do{
                    let users = try PersistenceService.context.fetch(fetchRequest)
                    self.users = users
                }catch{}
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        var getUserCredentials = false
        for user in users{
            if user.email == userEmailTextField.text && user.password == userPasswordTextField.text{
                //displayMessage(message: "Welcome \(user.email)")
                getUserCredentials = true
                performSegue(withIdentifier: "mainMenu", sender: self)
                break
            }
        }
        
        if !getUserCredentials {
            displayMessage(message: "Invalid User name or password, please try again ")
        }
        
    }
    
    
    func displayMessage(message:String){
        let myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(action)
        self.present(myAlert,animated: true,completion: nil)
        
    }
    
}
