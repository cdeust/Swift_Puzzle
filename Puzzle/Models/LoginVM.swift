//
//  LoginVM.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

protocol LoginVCDelegate
{
    func didSuccessfullyLogin(user: User) -> Void
    func didFailedToLogin() -> Void
}

class LoginVM: NSObject {
    private var _loginText: String!
    private var _passwordText: String!
    private var _errorText: String!
    private var _createText: String!
    private var _delegate: LoginVCDelegate!
    
    var loginText: String {
        get {
            return _loginText
        }
        set {
            _loginText = newValue
        }
    }
    
    var passwordText: String {
        get {
            return _passwordText
        }
        set {
            _passwordText = newValue
        }
    }
    
    var errorText: String {
        get {
            return _errorText
        }
        set {
            _errorText = newValue
        }
    }
    
    var createText: String {
        get {
            return _createText
        }
        set {
            _createText = newValue
        }
    }
    
    var delegate: LoginVCDelegate {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    func initWithDelegate(delegate:LoginVCDelegate) -> AnyObject
    {
        self._delegate = delegate
        
        return self
    }
    
    func initWithEmailPasswordDelegate(email: String, password: String, delegate: LoginVCDelegate) -> AnyObject
    {
        self._loginText = email
        self._passwordText = password
        self._delegate = delegate
        
        return self
    }
    
    func login() -> Void
    {
        let coreDataStack = CoreDataStack.sharedStack
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        let result = User.fetchUserWithEmail(email: self.loginText, password: self.passwordText, managedObjectContext: managedObjectContext)
        
        if (result.count > 0)
        {
            self.errorText = NSLocalizedString("logged_in", comment:"You're connected !")
            
            let user: User = result[0] as! User
            self.delegate.didSuccessfullyLogin(user: user)
        }
        else
        {
            self.errorText = NSLocalizedString("failed_to_login", comment:"Email or password mismatched.")
            self.delegate.didFailedToLogin()
        }
    }
}
