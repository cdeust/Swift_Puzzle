//
//  LoginVC+LoginDelegate.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: Delegate methods

extension LoginVC: LoginVCDelegate {
    func didSuccessfullyLogin(user: User) -> Void
    {
        self.error.text = self.viewModel.errorText
        self.error.textColor = UIColor().getColorForSuccess()
        
        self.user = user;
        
        self.email.layer.borderColor = UIColor().designTextfieldWithOkColor().cgColor
        self.password.layer.borderColor = UIColor().designTextfieldWithOkColor().cgColor
        
//        self.performSegue(withIdentifier: "loadLoginSecondStep", sender:self)
    }
    func didFailedToLogin() -> Void
    {
        self.email.layer.borderColor = UIColor().designTextfieldWithErrorColor().cgColor
        self.password.layer.borderColor = UIColor().designTextfieldWithErrorColor().cgColor
        
        self.password.text = ""
        self.error.text = self.viewModel.errorText
    }
}
