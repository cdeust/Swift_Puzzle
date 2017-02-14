//
//  ChildSelectionVC.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: iVars & Outlets

class ChildSelectionVC: UIViewController {
    var children: NSArray!
    var activeField: UITextField!
    var userObject: UserObject!
    var childObject: ChildObject!
    var child: Children!
    var viewModel: ChildSelectionVM!
    
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
}

// MARK: View Initialization

extension ChildSelectionVC {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.initView()
        self.presentMenuWithUser(user: self.userObject)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Design initialization

extension ChildSelectionVC {
    func initView()
    {
        self.welcome = UILabel.designLabel(label: self.welcome)
    }
}

// MARK: Dynamic design initialization

extension ChildSelectionVC {
    func presentMenuWithUser(user: UserObject)
    {
        self.viewModel = ChildSelectionVM.init(userObject: self.userObject)
        self.welcome.text = self.viewModel.welcomeText
        self.children = self.viewModel.getChildrenForPresentAccount()
        
        var origin = 120
        for i in 0..<children.count
        {
            let c = children[i] as! Children
            let btn = UIButton.createWithTitleTargetAction(title: c.firstname!, target: self, action: #selector(ChildSelectionVC.initializeMenuChildren(sender:)))
            btn.tag = i
            self.view.addSubview(btn)
            self.setConstraintsForUIElementWithParentView(element: btn, parentView: self.view, verticalValue: origin)
            
            origin += 50
        }
        
        let addBtn = UIButton.createWithTitleTargetAction(title: NSLocalizedString("add_children", comment: "Add children"), target: self, action: #selector(ChildSelectionVC.showChildCreation(sender:)))
        self.view.addSubview(addBtn)
        self.setConstraintsForUIElementWithParentView(element: addBtn, parentView: self.view, verticalAlign: "top")
        
        let logoutBtn = UIButton.createWithTitleTargetAction(title: NSLocalizedString("log_out", comment: "Log out"), target: self, action: #selector(ChildSelectionVC.showLogin(sender:)))
        self.view.addSubview(logoutBtn)
        self.setConstraintsForUIElementWithParentView(element: logoutBtn, parentView: self.view, verticalAlign: "bottom")
    }
    
    func initializeMenuChildren(sender: UIButton)
    {
        self.child = children[sender.tag] as! Children
        self.childObject = self.viewModel.instantiateChildren(child: self.child, userObject: self.userObject)
        
        self.performSegue(withIdentifier: "loadGameMenu", sender: self)
    }
    
    func showChildCreation(sender: UIButton)
    {
        self.performSegue(withIdentifier: "loadChildCreation", sender: self)
    }
    
    func showLogin(sender: UIButton)
    {
        guard let navigationController = self.navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}

// MARK: Navigation

extension ChildSelectionVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "loadGameMenu"
        {
            let gameMenu = segue.destination as! GameMenuVC
            gameMenu.userObject = self.userObject
            gameMenu.childObject = self.childObject
        }
        if segue.identifier == "loadChildCreation"
        {
            let childCreation = segue.destination as! ChildCreationVC
            childCreation.userObject = self.userObject
        }
    }
}
