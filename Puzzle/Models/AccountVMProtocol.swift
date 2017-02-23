//
//  AccountVMProtocol.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

protocol AccountCreationVMProtocol
{
    var _firstnameText: String! { get set }
    var _lastnameText: String! { get set }
    var _emailText: String! { get set }
    var _passwordText: String! { get set }
    var _lockText: String! { get set }
    var _uidText: String! { get set }
    var _errorText: String! { get set }
    var _userObject: UserObject! { get set }
    var _delegate: AccountCreationVCProtocol! { get set }
    
    init(firstname: String, lastname: String, email: String, password: String, lock: String, delegate: AccountCreationVCProtocol)
    
    func createAccount() -> Void
    func instantiateUserObject(firstname: String, lastname: String, email: String, password: String, lock: String) -> UserObject
}
