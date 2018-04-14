//
//  ViewController.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    

    
    @IBOutlet weak var emailTxt: txtfieldStyle!
    @IBOutlet weak var PasswordTxt: txtfieldStyle!
    @IBAction func signInBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func prepareForUnwind(Segue: UIStoryboardSegue){
        
    }

    


}

