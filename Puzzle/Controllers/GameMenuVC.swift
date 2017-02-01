//
//  GameMenuVC.swift
//  Puzzle
//
//  Created by User on 01/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit
import PasscodeLock

class GameMenuVC: UIViewController {
    
    var user: User!
    var child: Children!
    var userObject: UserObject!
    var childObject: ChildObject!
    var lockScreenVC: LockScreenVC!
    
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
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.userObject = UserObject.shared
        self.childObject = ChildObject.shared
        
        self.initView()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

extension GameMenuVC {
    func initView()
    {
        self.puzzleLabel = UILabel.designLabel(label: self.puzzleLabel)
        self.memoryLabel = UILabel.designLabel(label: self.memoryLabel)
        self.abcLabel = UILabel.designLabel(label: self.abcLabel)
        self.numberLabel = UILabel.designLabel(label: self.numberLabel)
        self.puzzleButton = UIButton.designButton(button: self.puzzleButton)
        self.memoryButton = UIButton.designButton(button: self.memoryButton)
        self.abcButton = UIButton.designButton(button: self.abcButton)
        self.numberButton = UIButton.designButton(button: self.numberButton)
    }
}

extension GameMenuVC {
    func sessionDidEnd()
    {
        // TODO present notification on Watch to tell the parents the game session is finished
    }
}

extension GameMenuVC {
    @IBAction func goBackToMenu(sender: UIButton)
    {
        lockScreenVC = LockScreenVC(nibName: "LockScreen", bundle: nil)
        
    }
}
