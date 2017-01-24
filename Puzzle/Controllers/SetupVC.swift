//
//  SetupVC.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: Vars & Outlets

class SetupVC: UIViewController {
    var activeField: UITextField!
    var user: User?
    var viewModel: SetupVM!
    var delegate: SetupVCDelegate!
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var lock: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
}

// MARK: View initialization

extension SetupVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.initView()
        
        self.registerForKeyboardNotifications()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Design initialization

extension SetupVC {
    func initView() {
        self.firstname = UITextField().designTextfield(textfield: self.firstname)
        self.lastname = UITextField().designTextfield(textfield: self.lastname)
        self.email = UITextField().designTextfield(textfield: self.email)
        self.lock = UITextField().designTextfield(textfield: self.lock)
        self.password = UITextField().designTextfield(textfield: self.password)
        self.create = UIButton().designButton(button: self.create)
        self.login = UIButton().designButton(button: self.login)
        self.error = UILabel().designLabel(label: self.error)
    }
}

// MARK: Action

extension SetupVC {
    @IBAction func createAccount(sender: UIButton) {
        if let firstname = self.firstname.text, let lastname = self.lastname.text, let email = self.email.text, let password = self.password.text, let lock = self.lock.text
        {
            self.viewModel = SetupVM().initWithFirstnameLastnameEmailPasswordLockDelegate(firstname: firstname, lastname: lastname, email: email, password: password, lock: lock, delegate: self) as! SetupVM
            self.viewModel.createAccount()
        }
    }
}

extension SetupVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadSetupSecondStep"
        {
//            let secondStep = segue.destination as SetupSecondStepVC
//            secondStep.user = self.user
        }
    }
}
