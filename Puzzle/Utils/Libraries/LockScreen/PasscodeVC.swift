//
//  PasscodeVC.swift
//  Puzzle
//
//  Created by Clément DEUST on 02/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit
import SmileLock

protocol PasscodeVCDelegate {
    func successCreation(userObject: UserObject)
    func successSessionEnded()
    func fail()
}

class PasscodeVC: UIViewController {
    let kPasswordDigit = 4
    
    var comingFrom: String!
    var userObject: UserObject!
    var delegate: PasscodeVCDelegate!
    var passcodeContainerView: PasswordContainerView!
    
    @IBOutlet weak var passcodeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passcodeContainerView = PasswordContainerView.create(in: passcodeStackView, digit: kPasswordDigit)
        passcodeContainerView.delegate = self
        
        //customize password UI
        passcodeContainerView.tintColor = UIColor.black
        passcodeContainerView.highlightedColor = UIColor.black
    }
}

extension PasscodeVC: PasswordInputCompleteProtocol {
    public func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: NSError?)
    {
        if success
        {
            self.validationSuccess()
        }
        else
        {
            passcodeContainerView.clearInput()
        }
    }

    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String)
    {
        if (comingFrom == "accountCreation")
        {
            self.userObject.lock = input
            self.delegate.successCreation(userObject: self.userObject)
            validationSuccess()
        }
        else if (comingFrom == "gameMenu")
        {
            if validation(input)
            {
                self.delegate.successSessionEnded()
                validationSuccess()
            }
            else
            {
                validationFail()
            }
        }
    }
}

extension PasscodeVC {
    func validation(_ input: String) -> Bool
    {
        return input == self.userObject.lock
    }
    
    func validationSuccess()
    {
        dismiss(animated: true, completion: nil)
    }
    
    func validationFail()
    {
        passcodeContainerView.wrongPassword()
    }
}
