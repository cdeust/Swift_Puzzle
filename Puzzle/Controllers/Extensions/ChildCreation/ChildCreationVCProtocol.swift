//
//  ChildCreationVCProtocol.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

protocol ChildCreationVCProtocol {
    func didSuccessfullyCreateAccount(childObject: ChildObject)
    func didFailToCreateAccount()
}
