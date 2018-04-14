//
//  AccountManagementVC.swift
//  FundYoung
//
//  Created by Janjao on 14/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import FirebaseAuth

class AccountManagementVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    @IBAction func LogOutPressed(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: TO_LOGOUT, sender: self)
    }
    
   
}
