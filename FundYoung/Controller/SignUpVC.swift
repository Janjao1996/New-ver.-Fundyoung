//
//  SignUpVC.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

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
        creareDatePickerView()

    }
    func creareDatePickerView() {
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

    
    

}
