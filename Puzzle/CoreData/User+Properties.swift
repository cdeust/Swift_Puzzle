//
//  User+Properties.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import CoreData


extension User {
    @NSManaged public var children: Int16
    @NSManaged public var email: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var lock: String?
    @NSManaged public var password: String?
    @NSManaged public var role: String?
    @NSManaged public var uid: String?

}
