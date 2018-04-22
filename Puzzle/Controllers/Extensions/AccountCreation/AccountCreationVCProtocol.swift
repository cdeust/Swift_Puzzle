//
//  AccountCreationVCProtocol.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation


protocol AccountCreationVCProtocol {
    func didSuccessfullyCreateAccount(userObject: UserObject) -> Void
    func didFailedToCreateAccount() -> Void
    func didSetLockCodeSuccessfully(lockCode: String)
}
