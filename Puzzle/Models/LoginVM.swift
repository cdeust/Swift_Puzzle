//
//  LoginVM.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

class LoginVM: LoginVMProtocol {
    internal var _loginText: String!
    internal var _passwordText: String!
    internal var _errorText: String!
    internal var _createText: String!
    internal var _delegate: LoginVCProtocol!
    internal var _userObject: UserObject!
    
    var loginText: String {
        get { return _loginText }
        set { _loginText = newValue }
    }
    
    var passwordText: String {
        get { return _passwordText }
        set { _passwordText = newValue }
    }
    
    var errorText: String {
        get { return _errorText }
        set { _errorText = newValue }
    }
    
    var createText: String {
        get { return _createText }
        set { _createText = newValue }
    }
    
    var delegate: LoginVCProtocol {
        get { return _delegate }
        set { _delegate = newValue }
    }
    
    var userObject: UserObject {
        get { return _userObject }
        set { _userObject = newValue }
    }
    
    required init(delegate:LoginVCProtocol) {
        self._delegate = delegate
    }
    
    required init(email: String, password: String, delegate: LoginVCProtocol) {
        self._loginText = email
        self._passwordText = password
        self._delegate = delegate
    }
    
    func login() -> Void {
        let coreDataStack = CoreDataStack.sharedStack
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        let result = User.fetchUserWithEmail(email: self.loginText, password: self.passwordText, managedObjectContext: managedObjectContext)
        
        if (result.count > 0) {
            self.errorText = NSLocalizedString("logged_in", comment:"You're connected !")
            
            let user: User = result[0] as! User
            self._userObject = self.instantiateUserObject(user: user)
            self.delegate.didSuccessfullyLogin(userObject: self.userObject)
        } else {
            self.errorText = NSLocalizedString("failed_to_login", comment:"Email or password mismatched.")
            self.delegate.didFailedToLogin()
        }
    }
    
    func instantiateUserObject(user: User) -> UserObject {
        let userObject = UserObject(firstname: user.firstname!, lastname: user.lastname!, email: user.email!, password: user.password!, uid: user.uid!, role: Role.parent, lock: user.lock!)
        
        return userObject
    }
}
