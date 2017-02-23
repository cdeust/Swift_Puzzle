//
//  AccountCreationVM.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

class AccountCreationVM: AccountCreationVMProtocol {
    internal var _firstnameText: String!
    internal var _lastnameText: String!
    internal var _emailText: String!
    internal var _passwordText: String!
    internal var _lockText: String!
    internal var _uidText: String!
    internal var _errorText: String!
    internal var _delegate: AccountCreationVCProtocol!
    internal var _userObject: UserObject!
    
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
    
    var delegate: AccountCreationVCProtocol {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    var userObject: UserObject {
        get {
            return _userObject
        }
        set {
            _userObject = newValue
        }
    }
    
    required init(firstname: String, lastname: String, email: String, password: String, lock: String, delegate: AccountCreationVCProtocol)
    {
        self._userObject = self.instantiateUserObject(firstname: firstname, lastname: lastname, email: email, password: password, lock: lock)
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
            self.delegate.didSuccessfullyCreateAccount(userObject: self.userObject)
        }
        else
        {
            self.errorText = NSLocalizedString("creation_failed", comment: "Your account failed to create !")
            self.delegate.didFailedToCreateAccount()
        }
    }
    
    func instantiateUserObject(firstname: String, lastname: String, email: String, password: String, lock: String) -> UserObject
    {
        let userObject = UserObject(firstname: firstname, lastname: lastname, email: email, password: password, uid: String().uid(), role: Role.parent, lock: lock)
        
        return userObject
    }
}
