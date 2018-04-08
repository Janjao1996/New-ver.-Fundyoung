//
//  AuthService.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
import Alamofire
class AuthService {
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    var IsLoggedIn : Bool{
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    var authToke: String{
        get{
            return defaults.value(forKey: TOKEN_KEY)as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
        
    }
    var userEmail: String{
        get{
            return defaults.value(forKey: USER_EMAIL)as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
        
    }
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let header = ["Content-Type": "application/json; charset=utf-8"]
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (respone) in
            if respone.result.error == nil{
                completion(true)
                
            }
            else{
                completion(false)
                debugPrint(respone.result.error as Any)
            }
        }
        
    }
    
}
