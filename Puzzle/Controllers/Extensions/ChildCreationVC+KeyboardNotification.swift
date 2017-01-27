//
//  ChildCreationVC+KeyboardNotification.swift
//  Puzzle
//
//  Created by User on 27/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// TODO: Refactor both Keyboard Notification extensions inside a single one

// MARK: Keyboard notification methods

extension ChildCreationVC {
    func registerForKeyboardNotifications() -> Void
    {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keyboardWillShow), name:NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(note:NSNotification) -> Void
    {
        if let keyboardSize = (note.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
            var frame: CGRect = self.scrollView.frame
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(0.3)
            
            if (UIInterfaceOrientationIsPortrait(orientation))
            {
                frame.size.height -= keyboardSize.size.height
            }
            else
            {
                frame.size.height -= keyboardSize.size.width
            }
            
            self.scrollView.frame = frame
            
            if (self.activeField != nil)
            {
                let textFieldRect: CGRect = self.scrollView.convert(self.activeField.bounds, from:self.activeField)
                self.scrollView.scrollRectToVisible(textFieldRect, animated: false)
            }
            
            UIView.commitAnimations()
        }
    }
    
    func keyboardWillHide(note: NSNotification) -> Void
    {
        if let keyboardSize = (note.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
            var frame: CGRect = self.scrollView.frame
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(0.3)
            
            if (UIInterfaceOrientationIsPortrait(orientation))
            {
                frame.size.height += keyboardSize.size.height
            }
            else
            {
                frame.size.height += keyboardSize.size.width
            }
            
            self.scrollView.frame = frame
            
            UIView.commitAnimations()
        }
    }
}
