//
//  UserObject.swift
//  Puzzle
//
//  Created by Clément DEUST on 31/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

class UserObject {
    
    private var _firstname: String?
    private var _lastname: String?
    private var _email: String?
    private var _password: String?
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
    
    var lock: String? {
        get {
            return _lock
        }
        set {
            _lock = newValue
        }
    }
    
    static let shared = UserObject()
    
    private init() {}
}
