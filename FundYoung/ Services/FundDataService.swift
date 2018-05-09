//
//  FundDataService.swift
//  FundYoung
//
//  Created by Janjao on 18/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
import Charts
import Alamofire
import FirebaseAuth
import SwiftyJSON

class  FundDataService {
    static let instance = FundDataService()
    var Funds = [Fund]()


    
    func requestAllFundData(completionHandler: @escaping() -> ()) {
        let URL_GETALLFUNDS = "https://fundyoung.herokuapp.com/allfunds"
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        print(Token)
        let headers = [
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer " + Token!
        ]
        Alamofire.request(URL_GETALLFUNDS, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
                guard let data = response.data else{return}
    
                do {
                    let temp = response.result.value as! [[String: Any]]
                    for x in temp{
                        let name = x["name"] as? String ?? ""
                        let risk = x["risk"] as? Int ?? 0
                        let type = x["type"] as? String ?? ""
                        let fund = Fund(name: name, risk: risk, type: type)
                        self.Funds.append(fund)
                    }
//            
                    completionHandler()
                }
                catch let error{
                    debugPrint(error as Any)
                }
            }
            else{
                debugPrint(response.result.error as Any)
            }
           
        })
        
       
        
    }
    func requestFundReturn(fundID: String , completionHandle: @escaping (Double)-> ())  {
        let URL_GETRETURN = "https://fundyoung.herokuapp.com/return/" + fundID
        print(URL_GETRETURN)
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer " + Token!
        ]
        
        Alamofire.request(URL_GETRETURN, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
               // guard let data = response.data else{return}
                
                do {
                   // print(response.result.value)
                    let temp = response.result.value as! [String: Any]
                    completionHandle(temp["fundreturn"] as? Double ?? 0)
                }
                catch let error{
                    debugPrint(error as Any)
                }
                
            }
            else{
                debugPrint(response.result.error as Any)
            }
        })
        
        
    }

   
 
    private var Types = ["Equity","Fixed Income","Money Market","Commodities"]
    func getTypes()-> [String]{
        return Types
    }
  
    func getAllFunds() -> [Fund] {
        return Funds
        
    }
    
    
    func getFundNAV(fundID: String , completionHandle: @escaping (Double)-> ())  {
        let URL_GETRETURN = "https://fundyoung.herokuapp.com/nav/" + fundID
        //print(URL_GETRETURN)
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer " + Token!
        ]
        
        Alamofire.request(URL_GETRETURN, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
                // guard let data = response.data else{return}
                
                do {
                  //  print(response.result.value)
                    let temp = response.result.value as! [String: Any]
                    completionHandle(temp["nav"] as? Double ?? 0)
                }
                catch let error{
                    debugPrint(error as Any)
                }
                
            }
            else{
                debugPrint(response.result.error as Any)
            }
        })
        
        
    }
   

    
}
 
