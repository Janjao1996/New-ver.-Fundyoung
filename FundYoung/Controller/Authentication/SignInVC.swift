//
//  ViewController.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    

    
    @IBOutlet weak var emailTxt: txtfieldStyle!
    @IBOutlet weak var PasswordTxt: txtfieldStyle!
    @IBAction func signInBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text else{return}
        guard let pass = PasswordTxt.text else{return}
        
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if error == nil && user != nil{
                user?.getIDTokenForcingRefresh(true, completion: { (idToken, error) in
                    
                    if let token = idToken {
                        UserDefaults.standard.set(token, forKey: "UserToken")
                        print(UserDefaults.standard.string(forKey: "UserToken"))
                    }
                })
                self.performSegue(withIdentifier: TO_LOGIN, sender: self)
            }
            else{
                 print("Error Log In:\(error!.localizedDescription)")
            }
        }
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func prepareForUnwind(Segue: UIStoryboardSegue){
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: TO_LOGIN, sender: self)
        }
    }

    


}

