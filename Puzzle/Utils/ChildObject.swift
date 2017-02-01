//
//  ChildObject.swift
//  Puzzle
//
//  Created by User on 01/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

class ChildObject {
    
    private var _firstname: String?
    private var _lastname: String?
    private var _birthdate: String?
    private var _sex: String?
    
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
    
    var birthdate: String? {
        get {
            return _birthdate
        }
        set {
            _birthdate = newValue
        }
    }
    
    var sex: String? {
        get {
            return _sex
        }
        set {
            _sex = newValue
        }
    }
    
    static let shared = ChildObject()

    private init() {}
}
