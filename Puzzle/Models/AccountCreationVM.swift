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
}

class AccountCreationVM: NSObject {
    var firstnameText: String!
    var lastnameText: String!
    var emailText: String!
    var passwordText: String!
    var lockText: String!
    var uidText: String!
    var errorText: String!
    var delegate: AccountCreationVCDelegate!
    
    func initWithDelegate(delegate:AccountCreationVCDelegate) -> AnyObject
    {
        self.delegate = delegate
        self.errorText = ""
        
        return self
    }
    
    func initWithFirstnameLastnameEmailPasswordLockDelegate(firstname: String, lastname: String, email: String, password: String, lock: String, delegate:AccountCreationVCDelegate) -> AnyObject
    {
        self.firstnameText = firstname
        self.lastnameText = lastname
        self.emailText = email
        self.passwordText = password
        self.lockText = lock
        self.delegate = delegate
        self.uidText = String().uid()
        
        self.errorText = ""
        
        return self
    }
    
    func createAccount() -> Void
    {
        let coreDataStack = CoreDataStack()
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
