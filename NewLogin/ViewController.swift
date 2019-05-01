//
//  ViewController.swift
//  NewLogin
//
//  Created by Marlon Escobar on 2019-04-30.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Step # 1")
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }


}

