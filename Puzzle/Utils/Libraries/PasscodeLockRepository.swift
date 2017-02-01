//
//  PasscodeLockRepository.swift
//  Puzzle
//
//  Created by User on 31/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit
import PasscodeLock

class PasscodeRepository: PasscodeRepositoryType {
    
    var hasPasscode: Bool = false
    var passcode: [String]?
    var user: UserObject!
    
    var lockCode = ""
    
    
    func savePasscode(passcode: [String])
    {
        for i in 0..<passcode.count
        {
            lockCode += "\(passcode[i])"
        }
        
        self.user = UserObject.shared
        self.user.lock = lockCode
    }
    
    func deletePasscode()
    {
        lockCode = ""
        self.user = UserObject.shared
        self.user.lock = lockCode
    }
}
