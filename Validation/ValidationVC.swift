//
//  ViewController.swift
//  Validation
//
//  Created by Belal medhat on 8/18/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import UIKit

class ValidationVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PasswordNote.alpha = 0
        UserNameNote.alpha = 0
        EmailNote.alpha = 0
        Email.addPadding(padding: .left(10))
        Password.addPadding(padding: .left(10))
        UserName.addPadding(padding: .left(10))
    }
    @IBAction func Name(_ sender: UITextField) { // Editing Changed IBOutlet
        UserNameNote.alpha = 0
        UserNameNote.text = ""

              do{
                  try Validation.validateName(name: UserName.text ?? "")
                  Email.isUserInteractionEnabled = true
                  Password.isUserInteractionEnabled = true
              }catch{
                  UserNameNote.text = "\(error)"
                  Email.isUserInteractionEnabled = false
                  Password.isUserInteractionEnabled = false
                  UserNameNote.alpha = 1
              }
    }
    @IBAction func Email(_ sender: UITextField) { // Editing Changed IBOutlet
        EmailNote.alpha = 0
        EmailNote.text = ""
           do{
               try Validation.validateEmail(email: Email.text ?? "")
               UserName.isUserInteractionEnabled = true
               Password.isUserInteractionEnabled = true

           }catch{
               EmailNote.text = "\(error)"
               UserName.isUserInteractionEnabled = false
               Password.isUserInteractionEnabled = false
               EmailNote.alpha = 1
           }

    }
    @IBAction func Password(_ sender: UITextField) { // Editing Changed IBOutlet
        PasswordNote.alpha = 0
        PasswordNote.text = ""

        do{
            try Validation.validatePassword(password: Password.text ?? "")
            Email.isUserInteractionEnabled = true
            UserName.isUserInteractionEnabled = true

        }catch{
            PasswordNote.text = "\(error)"
            Email.isUserInteractionEnabled = false
            UserName.isUserInteractionEnabled = false
            PasswordNote.alpha = 1
        }
    }
    @IBOutlet weak var PasswordNote: UILabel!
    @IBOutlet weak var EmailNote: UILabel!
    @IBOutlet weak var UserNameNote: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var UserName: UITextField!
 
    @IBAction func SignUp(_ sender: UIButton) {
        guard Password.text != "" && UserName.text != "" && Email.text != "" else { return }
        successMessage()
    }
    func successMessage(){
        let alert = UIAlertController(title: "", message: "Registered Successfully", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UITextField {
    enum PaddingSpace {
        case left(CGFloat)
        case right(CGFloat)
        case equalSpacing(CGFloat)
    }

    func addPadding(padding: PaddingSpace) {

        self.leftViewMode = .always
        self.layer.masksToBounds = true

        switch padding {

        case .left(let spacing):
            let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = leftPaddingView
            self.leftViewMode = .always

        case .right(let spacing):
            let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = rightPaddingView
            self.rightViewMode = .always

        case .equalSpacing(let spacing):
            let equalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = equalPaddingView
            self.leftViewMode = .always
            // right
            self.rightView = equalPaddingView
            self.rightViewMode = .always
        }
    }
    }


