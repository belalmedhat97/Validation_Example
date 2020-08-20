//
//  ValidationHelper.swift
//  GameWO
//
//  Created by Belal medhat on 6/18/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
enum ValidationError: String {

    case NotValidEmail = "Your Email Must be In Format of User123@Example.com"
    case NotValidPassword = "Your Password Must Be Greater Than 6 Digits and Contain Numbers,letters and Special Characters"
    case NotValidUsername = "Your Username Must Be In Range Of 3 To 20 Letters And Doesn't Contain Any Special Characters"
    case notValidPhone = "Your Phone Number is Not a Valid"
    case EmptyField = "You Must Fill These Field"
    case requirePasswordField = "You Must Enter Password TextField First Before Entering Confirm Password TextField"
    case misMatchPassword = "Your Confirm Password Must Be Similar To Password Renter It Again"
}

class Validation:ValidateFunction {
    
 static   func validateName(name: String) throws {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          guard name != "" else { throw "Username Field Empty" + " " + ValidationError.EmptyField.rawValue   }
          let nameRegex = "^[a-zA-Z ]{3,20}$"
          let trimmedString = name.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          guard isValidateName == true else {throw ValidationError.NotValidUsername.rawValue }
       }

 static   func validateEmail(email: String) throws {
          guard email != "" else { throw "Email Field Empty" + " " + ValidationError.EmptyField.rawValue}
          let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
          let trimmedString = email.trimmingCharacters(in: .whitespaces)
          let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          let isValidateEmail = validateEmail.evaluate(with: trimmedString)
          guard isValidateEmail == true else { throw ValidationError.NotValidEmail.rawValue }

       }
 class   func validatePassword(password: String) throws {
          //Minimum 6 characters at least 1 Alphabet and 1 Number:
          guard password != "" else { throw "Password Field Empty" + " " + ValidationError.EmptyField.rawValue }
          let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
          let trimmedString = password.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          guard isvalidatePass == true else { throw ValidationError.NotValidPassword.rawValue }

       }
//    func validateAnyOtherTextField(otherField: String) throws {
//          let otherRegexString = "Your regex String"
//          let trimmedString = otherField.trimmingCharacters(in: .whitespaces)
//          let validateOtherString = NSPredicate(format: "SELF MATCHES %@", otherRegexString)
//          let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
////          return isValidateOtherString
//       }
static    func ValidationPasswordRequiredFirst(Password:String) throws {
        guard Password != "" else { throw ValidationError.requirePasswordField.rawValue }
           }
static    func validationConfirmPassword(Password:String,ConfirmPassword: String) throws {
        guard ConfirmPassword == Password else { throw ValidationError.misMatchPassword.rawValue }
    }
    
}
extension String: Error {}
