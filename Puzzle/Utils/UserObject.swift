//
//  UserObject.swift
//  Puzzle
//
//  Created by Clément DEUST on 31/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

class UserObject {
    
    var firstname: String!
    var lastname: String!
    var email: String!
    var password: String!
    var lock: String!
    
    static let shared = UserObject()
}
