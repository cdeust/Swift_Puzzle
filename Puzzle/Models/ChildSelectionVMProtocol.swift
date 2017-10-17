//
//  ChildSelectionVMProtocol.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

protocol ChildSelectionVMProtocol {
    var _welcomeText: String! { get set }
    var _userObject: UserObject! { get set }
    
    init(userObject: UserObject)
    
    func getChildrenForPresentAccount() -> NSArray
    func instantiateChildren(child: Children, userObject: UserObject) -> ChildObject
}
