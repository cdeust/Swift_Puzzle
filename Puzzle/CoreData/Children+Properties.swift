//
//  Children+Properties.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import CoreData

extension Children {
    @NSManaged public var birthdate: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var role: String?
    @NSManaged public var sex: String?
    @NSManaged public var uid: String?
}
