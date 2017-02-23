//
//  ChildCreationVMProtocol.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

protocol ChildCreationVMProtocol {
    var _birthdateText: String! { get set }
    var _firstnameText: String! { get set }
    var _lastnameText: String! { get set }
    var _emailText: String! { get set }
    var _sexText: String! { get set }
    var _uidText: String! { get set }
    var _errorText: String! { get set }
    var _delegate: ChildCreationVCProtocol! { get set }
    var _childObject: ChildObject! { get set }
    
    init(firstname: String, lastname: String, birthdate: String, sex: String, userObject: UserObject, delegate: ChildCreationVCProtocol)
    
    func createChild() -> Void
    func instantiateChildObject(firstname: String, lastname: String, birthdate: String, sex: String, userObject: UserObject) -> ChildObject
}
