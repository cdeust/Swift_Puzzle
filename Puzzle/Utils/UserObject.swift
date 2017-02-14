//
//  UserObject.swift
//  Puzzle
//
//  Created by Clément DEUST on 31/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

struct UserObject {
    
    private var _firstname: String?
    private var _lastname: String?
    private var _email: String?
    private var _password: String?
    private var _uid: String?
    private var _role: Role?
    private var _lock: String?
    
    var firstname: String? {
        get {
            return _firstname
        }
        set {
            _firstname = newValue
        }
    }
    
    var lastname: String? {
        get {
            return _lastname
        }
        set {
            _lastname = newValue
        }
    }
    
    var email: String? {
        get {
            return _email
        }
        set {
            _email = newValue
        }
    }
    
    var password: String? {
        get {
            return _password
        }
        set {
            _password = newValue
        }
    }
    
    var uid: String? {
        get {
            return _uid
        }
        set {
            _uid = newValue
        }
    }
    
    var role: Role? {
        get {
            return _role
        }
        set {
            _role = newValue
        }
    }
    
    var lock: String?  {
        get {
            return _lock
        }
        set {
            _lock = newValue
        }
    }
    
    init(firstname: String, lastname: String, email: String, password: String, uid: String, role: Role, lock: String) {
        _firstname = firstname
        _lastname = lastname
        _email = email
        _password = password
        _uid = uid
        _role = role
        _lock = lock
    }
}
