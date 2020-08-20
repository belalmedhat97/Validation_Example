//
//  ValidatorProtocols.swift
//  GameWO
//
//  Created by Belal medhat on 6/21/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
protocol ValidateFunction{
    static  func validateName(name: String) throws
    static  func validateEmail(email: String) throws
    static  func validatePassword(password: String) throws
    static  func ValidationPasswordRequiredFirst(Password:String) throws
    static  func validationConfirmPassword(Password:String,ConfirmPassword: String) throws
}
