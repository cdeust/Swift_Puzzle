//
//  GameMenuVC.swift
//  Puzzle
//
//  Created by User on 01/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

class GameMenuVC: UIViewController {
    
    var childObject: ChildObject!
    var userObject: UserObject!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var puzzleLabel: UILabel!
    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var abcLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var puzzleButton: UIButton!
    @IBOutlet weak var memoryButton: UIButton!
    @IBOutlet weak var abcButton: UIButton!
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var back: UIButton!
}

extension GameMenuVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension GameMenuVC {
    func initView() {
        self.puzzleLabel = UILabel.designLabel(label: self.puzzleLabel)
        self.memoryLabel = UILabel.designLabel(label: self.memoryLabel)
        self.abcLabel = UILabel.designLabel(label: self.abcLabel)
        self.numberLabel = UILabel.designLabel(label: self.numberLabel)
        self.puzzleButton = UIButton.designButtonNormal(button: self.puzzleButton)
        self.memoryButton = UIButton.designButtonNormal(button: self.memoryButton)
        self.abcButton = UIButton.designButtonNormal(button: self.abcButton)
        self.numberButton = UIButton.designButtonNormal(button: self.numberButton)
    }
}

extension GameMenuVC {
    func sessionDidEnd() {
        // TODO present notification on Watch to tell the parents the game session is finished
    }
}

extension GameMenuVC {
    @IBAction func goBackToMenu(sender: UIButton) {
        guard let storyboard = self.storyboard else { return }
        let passcodeVC = storyboard.instantiateViewController(withIdentifier: "PasscodeVC") as! PasscodeVC
        passcodeVC.modalTransitionStyle = .crossDissolve
        passcodeVC.modalPresentationStyle = .overCurrentContext
        passcodeVC.userObject = self.userObject
        passcodeVC.comingFrom = "gameMenu"
        passcodeVC.delegate = self
        present(passcodeVC, animated: true, completion: nil)
    }
}
