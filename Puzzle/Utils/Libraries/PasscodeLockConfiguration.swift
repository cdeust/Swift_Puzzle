//
//  PasscodeLockConfiguration.swift
//  Puzzle
//
//  Created by User on 31/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit
import PasscodeLock

class PasscodeLockConfiguration: PasscodeLockConfigurationType {
    let repository: PasscodeRepositoryType
    var passcodeLength = 4
    var isTouchIDAllowed = true
    var shouldRequestTouchIDImmediately = true
    var maximumIncorrectPasscodeAttempts = 3
    
    init(repository: PasscodeRepositoryType)
    {
        self.repository = repository
    }
    
    init()
    {
        self.repository = PasscodeRepository()
    }
}
