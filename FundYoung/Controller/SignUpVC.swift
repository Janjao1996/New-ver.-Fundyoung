//
//  SignUpVC.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    @IBOutlet weak var RepasswordTxt: UITextField!
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    
    @IBOutlet weak var DOBTxt: UITextField!
    let DOBPicker = UIDatePicker()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePickerView()
        let doneBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        doneBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
        doneBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneBtn.layer.borderWidth = 0.5
        doneBtn.addTarget(self, action: #selector(SignUpVC.done), for: .touchUpInside)
        emailTxt.inputAccessoryView = doneBtn
        PasswordTxt.inputAccessoryView = doneBtn
        RepasswordTxt.inputAccessoryView = doneBtn
        firstNameTxt.inputAccessoryView = doneBtn
        lastNameTxt.inputAccessoryView = doneBtn
        
        

    }
    //var Email: String!
   // var Passwd: String!
    @objc func done() {
        /*
        if let email = emailTxt.text{
            Email = email
            view.endEditing(true)
        }
        if let pass = PasswordTxt.text {
            Passwd = pass
            view.endEditing(true)
        }
        */
        view.endEditing(true)
    }
    func createDatePickerView() {
        let ToolBar = UIToolbar()
        ToolBar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil , action: #selector(donePressed))
        ToolBar.setItems([done], animated: false)
        DOBTxt.inputAccessoryView = ToolBar
        DOBTxt.inputView = DOBPicker
        DOBPicker.datePickerMode = .date
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString  = formatter.string(from: DOBPicker.date)
        DOBTxt.text = "\(dateString)"
        self.view.endEditing(true)
        
    }
    @IBAction func signUpPressed(_ sender: Any) {
        if let email = emailTxt.text, let pass = PasswordTxt.text {
            print(email)
            print(pass)
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u = user{
                    
                    self.performSegue(withIdentifier: "goToLogIn", sender: self)
                }
                else{
                    print("error")
                }
            }
            
        }
        
    }
    
    
    

}
