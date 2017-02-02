//
//  AccountCreationVC+PasscodeDelegate.swift
//  Puzzle
//
//  Created by User on 02/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension AccountCreationVC: PasscodeVCDelegate {
    func successCreation(userObject: UserObject)
    {
        if self.userObject.lock != nil
        {
            self.lock.text = userObject.lock
        }
    }
    
    func fail()
    {
        self.lock.text = ""
    }
    
    func successSessionEnded() { }
}
