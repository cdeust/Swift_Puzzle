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
    func successCreation(lock: String)
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        passcodeContainerView = PasswordContainerView.create(in: passcodeStackView, digit: kPasswordDigit)
        passcodeContainerView.delegate = self
        
        //customize password UI
        passcodeContainerView.tintColor = UIColor.black
        passcodeContainerView.highlightedColor = UIColor.black
        if comingFrom == "accountCreation"
        {
            passcodeContainerView.touchAuthenticationEnabled = false
        }
        else if comingFrom == "gameMenu"
        {
            passcodeContainerView.touchAuthenticationEnabled = true
            passcodeContainerView.touchAuthenticationReason = NSLocalizedString("touch_id_required_end_session", comment: "Authentication is needed to prevent your child from ending his game session")
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
