//
//  Constants.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// url constants
let BASE_URL = "https://fundyoung.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)account/register"
// segue
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToLogIn"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

