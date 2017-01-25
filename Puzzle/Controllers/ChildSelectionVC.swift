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
    var child: NSArray!
    var activeField: UITextField!
    var viewModel: ChildSelectionVM!
    var children: Children!
    var user: User!
    
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
        self.presentMenuWithUser(user: self.user)
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
    func presentMenuWithUser(user: User) {
        self.viewModel = ChildSelectionVM().initWithUser(user: self.user) as! ChildSelectionVM
        self.welcome.text = self.viewModel.welcomeText
        
        self.child = self.viewModel.getChildrenForPresentAccount()
        
        var origin = 100
        for i in 0..<child.count
        {
            let c = child[i] as! Children
            let btn = UIButton.createWithTitleTargetAction(title: c.firstname!, target: self, action: #selector(ChildSelectionVC.initializeMenuChildren(sender:)))
            btn.tag = i
            self.view.addSubview(btn)
            self.setConstraintsForUIElementWithParentView(element: btn, parentView: self.view, verticalValue: origin)
        }
        origin += 50
        
        let addBtn = UIButton.createWithTitleTargetAction(title: "Add children", target: self, action: #selector(ChildSelectionVC.showChildCreation(sender:)))
        self.view.addSubview(addBtn)
        self.setConstraintsForUIElementWithParentView(element: addBtn, parentView: self.view, verticalAlign: "top")
        
        let logoutBtn = UIButton.createWithTitleTargetAction(title: "Log out", target: self, action: #selector(ChildSelectionVC.showLogin(sender:)))
        self.view.addSubview(logoutBtn)
        self.setConstraintsForUIElementWithParentView(element: logoutBtn, parentView: self.view, verticalAlign: "bottom")
    }
    
    func initializeMenuChildren(sender: UIButton) {
        self.children = child[sender.tag] as! Children
        self.performSegue(withIdentifier: "loadMenu", sender: self)
    }
    
    func showChildCreation(sender: UIButton) {
        self.performSegue(withIdentifier: "loadChildCreation", sender: self)
    }
    
    func showLogin(sender: UIButton) {
        guard let navigationController = self.navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}

extension ChildSelectionVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "loadMenu"
        {
            /*
            let menu = segue.destination as! MenuVC
            menu.user = self.user
            menu.children = self.children
            */
        }
        if segue.identifier == "loadChildCreation"
        {
            /*
            let childCreation = segue.destination as! ChildCreationVC
            childCreation.user = self.user
            */
        }
    }
}
