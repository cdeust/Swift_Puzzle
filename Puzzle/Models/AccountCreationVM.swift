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
    func didSuccessfullyCreateAccount() -> Void
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
    
    init(firstname: String, lastname: String, email: String, password: String, lock: String, delegate: AccountCreationVCDelegate)
    {
        super.init()
        
        let userObject = self.instantiateUserObject(firstname: firstname, lastname: lastname, email: email, password: password, lock: lock)
        
        self._firstnameText = userObject.firstname
        self._lastnameText = userObject.lastname
        self._emailText = userObject.email
        self._passwordText = userObject.password
        self._lockText = userObject.lock
        self._uidText = userObject.uid
        self._delegate = delegate
        
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
            self.delegate.didSuccessfullyCreateAccount()
        }
        else
        {
            self.errorText = NSLocalizedString("creation_failed", comment: "Your account failed to create !")
            self.delegate.didFailedToCreateAccount()
        }
    }
    
    func instantiateUserObject(firstname: String, lastname: String, email: String, password: String, lock: String) -> UserObject
    {
        let userObject = UserObject.shared
        userObject.firstname = firstname
        userObject.lastname = lastname
        userObject.email = email
        userObject.password = password
        userObject.lock = lock
        userObject.uid = String().uid()
        
        return userObject
    }
}
