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
        let doneBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        doneBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
        doneBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneBtn.layer.borderWidth = 0.5
        doneBtn.addTarget(self, action: #selector(SignInVC.done), for: .touchUpInside)
        emailTxt.inputAccessoryView = doneBtn
        PasswordTxt.inputAccessoryView = doneBtn
    
    }
    
    @objc func done() {
        view.endEditing(true)
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

