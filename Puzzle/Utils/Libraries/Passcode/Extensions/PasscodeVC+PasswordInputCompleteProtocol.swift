//
//  PasscodeVC+PasswordInputCompleteProtocol.swift
//  Puzzle
//
//  Created by User on 02/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit
import SmileLock

extension PasscodeVC: PasswordInputCompleteProtocol {
    public func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: NSError?)
    {
        if (comingFrom == "gameMenu")
        {
            if success
            {
                self.delegate.successSessionEnded()
                self.validationSuccess()
            }
            else
            {
                passcodeContainerView.clearInput()
            }
        }
    }
    
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String)
    {
        if (comingFrom == "accountCreation")
        {
            self.delegate.successCreation(lock: input)
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
