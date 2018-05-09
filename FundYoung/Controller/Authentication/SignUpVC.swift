//
//  SignUpVC.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import FirebaseAuth
import Alamofire

class SignUpVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Gender.count
    }
    
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    @IBOutlet weak var RepasswordTxt: UITextField!
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    
    @IBOutlet weak var ErrorLbl: UILabel!
    @IBOutlet weak var GenderTXt: UITextField!
    @IBOutlet weak var DOBTxt: UITextField!
    let DOBPicker = UIDatePicker()

    let genderPicker = UIPickerView()
    let Gender = ["Male","Female"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        doneBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
        doneBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneBtn.layer.borderWidth = 0.5
        doneBtn.addTarget(self, action: #selector(SignInVC.done), for: .touchUpInside)
        
        createDatePickerView()

        GenderTXt.textAlignment = .center
        GenderTXt.inputView = genderPicker
        genderPicker.dataSource = self
        genderPicker.delegate = self
      
        firstNameTxt.inputAccessoryView = doneBtn
        lastNameTxt.inputAccessoryView = doneBtn
        emailTxt.inputAccessoryView = doneBtn
        PasswordTxt.inputAccessoryView = doneBtn
        RepasswordTxt.inputAccessoryView = doneBtn
        

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        GenderTXt.text = Gender[row]
        GenderTXt.resignFirstResponder()
    }
    
    @objc func done() {
  
        view.endEditing(true)
    }
  
  
    func createDatePickerView() {
        let ToolBar = UIToolbar()
        ToolBar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil , action: #selector(donePressed))
        ToolBar.setItems([done], animated: false)
        DOBTxt.inputAccessoryView = ToolBar
        DOBTxt.inputView = DOBPicker
        DOBTxt.textAlignment = .center
        DOBPicker.datePickerMode = .date
        
    }
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)
        
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
        if PasswordTxt.text == RepasswordTxt.text{
            guard let email = emailTxt.text  else{return}
            guard let pass = PasswordTxt.text else{return}
            guard let firstname = firstNameTxt.text else{return}
            guard let lastname = lastNameTxt.text else{return}
            guard let gender = GenderTXt.text else {return}
            guard let dob = DOBTxt.text else{return}
            let changedFormatDOB = convertDateFormater(dob)
            //print(gender)
           // print(changedFormatDOB)
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if error == nil  && user != nil{
                    user?.getIDTokenForcingRefresh(true, completion: { (idToken, error) in
                        let headers = [
                            "Content-Type": "application/json",
                            "Authorization": "Bearer " + idToken!
                        ]
                        //print(headers)
                        //print(idToken)
                        let parameters = [
                            "firstname": firstname,
                            "lastname": lastname,
                            "gender": gender,
                            "dob": changedFormatDOB,
                            "email": email
                        ]
                        print(parameters)
                        let URL = "https://fundyoung.herokuapp.com/adduser"
                        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { (respone) in
                            print(respone.result)
                            if respone.result.error == nil{
                                print(respone.result.value)
                            } else{
                                print(respone.result.error)
                            }
                        }
                        
                      
                    })
         
                    self.performSegue(withIdentifier: "goToLogIn", sender: self)
                    
                }
                else{
                    print("Error Log In:\(error!.localizedDescription)")
                }
                
            }
            
            
        }
        else{
            ErrorLbl.text = "Password and repassword are not the same"
            ErrorLbl.isHidden = false
            
            }
            
        
  
    }
    
    

}
