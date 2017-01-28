//
//  ChildCreationVC+ChildCreationDelegate.swift
//  Puzzle
//
//  Created by User on 27/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension ChildCreationVC: ChildCreationVCDelegate {
    func didSuccessfullyCreateAccount(user: Children)
    {
        self.error.text = self.viewModel.errorText
        self.error.textColor = UIColor.getColorForSuccess()
        
        self.birthdate.text = ""
        self.firstname.text = ""
        self.lastname.text = self.user.lastname
        self.sex.text = ""
        
        self.firstname.becomeFirstResponder()
    }
    
    func didFailToCreateAccount()
    {
        self.error.text = self.viewModel.errorText
        self.error.textColor = UIColor.getColorForFailure()
        
        self.birthdate.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.firstname.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.lastname.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
        self.sex.layer.borderColor = UIColor.designTextfieldWithErrorColor().cgColor
    }
}
