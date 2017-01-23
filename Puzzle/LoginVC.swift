//
//  LoginVC.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: Vars & Outlets

class LoginVC: UIViewController {
    var activeField: UITextField!
    var user: User?
    var viewDesign: LoginVD!
    var viewModel: LoginVM!
    var delegate: LoginVCDelegate!
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var create: UIButton!
    @IBOutlet var login: UIButton!
    @IBOutlet var error: UILabel!
    @IBOutlet var scrollView: UIScrollView!
}

// MARK: View initialization

extension LoginVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.viewDesign = LoginVD()
        self.viewDesign.doBaseInitialization()
        
        self.initView()
        
        self.registerForKeyboardNotifications()
    }
}

// MARK: Design initialization

extension LoginVC {
    func initView() {
        self.email = self.viewDesign.designTextfield(textfield: self.email)
        self.password = self.viewDesign.designTextfield(textfield: self.password)
        self.create = self.viewDesign.designButton(button: self.create)
        self.login = self.viewDesign.designButton(button: self.login)
        self.error = self.viewDesign.designErrorLabel(label: self.error)
    }
}

// MARK: UIButton

extension LoginVC {
    @IBAction func tryToLogin(sender: AnyObject)
    {
        if let email = self.email.text, let password = self.password.text {
            self.viewModel = LoginVM().initWithEmailPasswordDelegate(email: email, password: password, delegate: self.delegate) as! LoginVM
            self.viewModel.login();
        }
    }
}
