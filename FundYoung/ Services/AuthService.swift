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
