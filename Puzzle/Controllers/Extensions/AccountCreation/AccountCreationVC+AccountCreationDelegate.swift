//
//  AccountCreationVC+AccountCreationDelegate.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension AccountCreationVC: AccountCreationVCDelegate {
    func didSuccessfullyCreateAccount(userObject: UserObject)
    {
        self.userObject = userObject
        
        self.error.text = self.viewModel.errorText;
        self.error.textColor = UIColor.getColorForSuccess()
        
        self.firstname.layer.borderColor = UIColor.designTextfieldWithOkColor().cgColor
        self.lastname.layer.borderColor = UIColor.designTextfieldWithOkColor().cgColor
        self.email.layer.borderColor = UIColor.designTextfieldWithOkColor().cgColor
        self.password.layer.borderColor = UIColor.designTextfieldWithOkColor().cgColor
        self.lock.layer.borderColor = UIColor.designTextfieldWithOkColor().cgColor
        
        self.performSegue(withIdentifier: "loadChildCreation", sender: self)
    }
    
    func didFailedToCreateAccount()
    {
        self.error.text = self.viewModel.errorText;
        self.error.textColor = UIColor.getColorForFailure()
        self.firstname.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.lastname.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.email.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.password.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.lock.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
    }
    
    func didSetLockCodeSuccessfully(lockCode: String) {
        self.lock.text = lockCode
    }
}
