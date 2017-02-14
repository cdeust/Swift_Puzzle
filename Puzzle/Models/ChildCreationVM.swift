//
//  ChildCreationVM.swift
//  Puzzle
//
//  Created by User on 27/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

protocol ChildCreationVCDelegate {
    func didSuccessfullyCreateAccount(childObject: ChildObject)
    func didFailToCreateAccount()
}

class ChildCreationVM: NSObject {
    private var _birthdateText: String!
    private var _firstnameText: String!
    private var _lastnameText: String!
    private var _emailText: String!
    private var _sexText: String!
    private var _uidText: String!
    private var _errorText: String!
    private var _delegate: ChildCreationVCDelegate!
    private var _childObject: ChildObject!
    
    var birthdateText: String {
        get {
            return _birthdateText
        }
        set {
            _birthdateText = newValue
        }
    }
    
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
    
    var sexText: String {
        get {
            return _sexText
        }
        set {
            _sexText = newValue
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
    
    var delegate: ChildCreationVCDelegate {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    var childObject: ChildObject {
        get {
            return _childObject
        }
        set {
            _childObject = newValue
        }
    }
    
    init(firstname: String, lastname: String, birthdate: String, sex: String, userObject: UserObject, delegate: ChildCreationVCDelegate)
    {
        super.init()
        
        self._childObject = self.instantiateChildObject(firstname: firstname, lastname: lastname, birthdate: birthdate, sex: sex, userObject: userObject)
        self._firstnameText = childObject.firstname
        self._lastnameText = childObject.lastname
        self._emailText = childObject.email
        self._sexText = childObject.sex
        self._birthdateText = childObject.birthdate
        self._uidText = childObject.uid
        self._delegate = delegate
        
        self.errorText = ""
    }
    
    func createChild()
    {
        let coreDataStack = CoreDataStack.sharedStack
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        
        var results = Children.fetchChildrenWithFirstname(firstname: self.firstnameText, lastname: self.lastnameText, managedObjectContext: managedObjectContext)
        if results.count > 0
        {
            let managedObject = results[0] as! Children
            Children.updateChildrenWithUid(uid: self.uidText, email: self.emailText, firstname: self.firstnameText, lastname: self.lastnameText, sex: self.sexText, birthdate: self.birthdateText, role: "children", managedObjectContext: managedObjectContext, managedObject: managedObject)
        }
        else
        {
            Children.createChildrenWithUid(uid: self.uidText, email: self.emailText, firstname: self.firstnameText, lastname: self.lastnameText, sex: self.sexText, birthdate: self.birthdateText, role: "children", managedObjectContext: managedObjectContext)
        }
        
        results = Children.fetchChildrenWithUid(uid: self.uidText, managedObjectContext: managedObjectContext)
        
        if results.count > 0
        {
            self.errorText = NSLocalizedString("children_added", comment: "Your child was successfully added to your account !")
            self.delegate.didSuccessfullyCreateAccount(childObject: self.childObject)
        }
        else
        {
            self.errorText = NSLocalizedString("children_failed_adding", comment: "Your child was not added due to error")
            self.delegate.didFailToCreateAccount()
        }
    }
    
    func instantiateChildObject(firstname: String, lastname: String, birthdate: String, sex: String, userObject: UserObject) -> ChildObject
    {
        let childObject = ChildObject(firstname: firstname, lastname: lastname, email: userObject.email!, password: userObject.password!, uid: userObject.uid!, role: Role.child, sex: sex, birthdate: birthdate)
        
        return childObject
    }
}
