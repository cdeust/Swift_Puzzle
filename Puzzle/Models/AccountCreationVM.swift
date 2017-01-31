//
//  AccountCreationVM.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

protocol AccountCreationVCDelegate
{
    func didSuccessfullyCreateAccount(user: User) -> Void
    func didFailedToCreateAccount() -> Void
    func didSetLockCodeSuccessfully(lockCode: String)
}

class AccountCreationVM: NSObject {
    private var _firstnameText: String!
    private var _lastnameText: String!
    private var _emailText: String!
    private var _passwordText: String!
    private var _lockText: String!
    private var _uidText: String!
    private var _errorText: String!
    private var _delegate: AccountCreationVCDelegate!
    
    var firstnameText: String {
        get {
            return _firstnameText
        }
        set {
            _firstnameText = newValue
        }
    }
    
    var lastnameText: String {
        get {
            return _lastnameText
        }
        set {
            _lastnameText = newValue
        }
    }
    
    var emailText: String {
        get {
            return _emailText
        }
        set {
            _emailText = newValue
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
    
    var lockText: String {
        get {
            return _lockText
        }
        set {
            _lockText = newValue
        }
    }
    
    var uidText: String {
        get {
            return _uidText
        }
        set {
            _uidText = newValue
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
    
    var delegate: AccountCreationVCDelegate {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    init(delegate:AccountCreationVCDelegate)
    {
        self._delegate = delegate
        self._errorText = ""
    }
    
    init(userObject: UserObject, delegate:AccountCreationVCDelegate)
    {
        self._firstnameText = userObject.firstname
        self._lastnameText = userObject.lastname
        self._emailText = userObject.email
        self._passwordText = userObject.password
        self._lockText = userObject.lock
        self._delegate = delegate
        self._uidText = String().uid()
        
        self._errorText = ""
    }
    
    func createAccount() -> Void
    {
        let coreDataStack = CoreDataStack.sharedStack
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        var result = User.fetchUserWithEmail(email: self.emailText, managedObjectContext: managedObjectContext)
        
        if (result.count > 0)
        {
            let managedObject = result[0] as! User
            User.updateUserWithUid(uid: self.uidText, email: self.emailText, firstname: self.firstnameText, lastname: self.lastnameText, lock: self.lockText, password: self.passwordText, role: "master", managedObjectContext: managedObjectContext, managedObject: managedObject)
        }
        else
        {
            User.createUserWithUid(uid: self.uidText, email: self.emailText, firstname: self.firstnameText, lastname: self.lastnameText, lock: self.lockText, password: self.passwordText, role: "master", managedObjectContext: managedObjectContext)
        }
        
        result = User.fetchUserWithUid(uid: self.uidText, managedObjectContext: managedObjectContext)
        
        if (result.count > 0)
        {
            self.errorText = NSLocalizedString("created_account", comment: "Your account was successfully created !")
            let user = result[0] as! User
            self.delegate.didSuccessfullyCreateAccount(user: user)
        }
        else
        {
            self.errorText = NSLocalizedString("creation_failed", comment: "Your account failed to create !")
            self.delegate.didFailedToCreateAccount()
        }
    }
}
