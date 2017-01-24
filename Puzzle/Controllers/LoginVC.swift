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
    var viewModel: LoginVM!
    var delegate: LoginVCDelegate!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
}

// MARK: View initialization

extension LoginVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.initView()
        
        self.registerForKeyboardNotifications()
    }
}

// MARK: Design initialization

extension LoginVC {
    func initView() {
        self.email = UITextField().designTextfield(textfield: self.email)
        self.password = UITextField().designTextfield(textfield: self.password)
        self.create = UIButton().designButton(button: self.create)
        self.login = UIButton().designButton(button: self.login)
        self.error = UILabel().designErrorLabel(label: self.error)
    }
}

// MARK: Action

extension LoginVC {
    @IBAction func tryToLogin(sender: UIButton)
    {
        if let email = self.email.text, let password = self.password.text {
            self.viewModel = LoginVM().initWithEmailPasswordDelegate(email: email, password: password, delegate: self) as! LoginVM
            self.viewModel.login();
        }
    }
}

extension LoginVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadLoginSecondStep"
        {
            //            let secondStep = segue.destination as LoginSecondStepVC
            //            secondStep.user = self.user
        }
    }
}
