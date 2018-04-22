//
//  LoginVMProtocol.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

protocol LoginVMProtocol {
    var _loginText: String! { get set }
    var _passwordText: String! { get set }
    var _errorText: String! { get set }
    var _createText: String! { get set }
    var _delegate: LoginVCProtocol! { get set }
    var _userObject: UserObject! { get set }
    
    init(delegate: LoginVCProtocol)
    init(email: String, password: String, delegate: LoginVCProtocol)
    
    func login() -> Void
    func instantiateUserObject(user: User) -> UserObject
}
