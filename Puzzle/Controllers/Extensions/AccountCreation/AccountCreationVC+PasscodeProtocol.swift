//
//  AccountCreationVC+PasscodeDelegate.swift
//  Puzzle
//
//  Created by User on 02/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension AccountCreationVC: PasscodeVCProtocol {
    func successCreation(lock: String) {
        self.lock.text = lock
    }
    
    func fail() {
        self.lock.text = ""
    }
    
    func successSessionEnded() { }
}
