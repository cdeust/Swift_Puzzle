//
//  GameMenuVC+PasscodeDelegate.swift
//  Puzzle
//
//  Created by User on 02/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension GameMenuVC: PasscodeVCDelegate {
    func successSessionEnded()
    {
        guard let navigationController = self.navigationController else { return }
        navigationController.popViewController(animated: true)
    }
    
    func fail() { }
    func successCreation(lock: String) { }
}
