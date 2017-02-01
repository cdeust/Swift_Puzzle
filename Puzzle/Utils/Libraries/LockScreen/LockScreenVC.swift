//
//  LockScreenVC.swift
//  Puzzle
//
//  Created by User on 01/02/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

@objc protocol LockScreenDelegate {
    @objc optional func didEnterCorrectLockCode(lockCode: String)
    @objc optional func didEnterCorrectLockCode()
    @objc optional func didEnterWrongLockCode()
    @objc optional func didLockWithCode(lockCode: String) -> Bool
    @objc optional func didAllowTouchID(lockScreen: LockScreenVC) -> Bool
    @objc optional func lockScreenViewController(lockScreen: LockScreenVC, lockCode: String) -> Bool
}

// MARK: iVars & Outlets

class LockScreenVC: UIViewController {
    
    enum LockScreenMode {
        case Normal
        case New
        case Change
        case Verification
    }
    
    var lsm = LockScreenMode.Normal
    var prevlsm = LockScreenMode.Verification
    var confirmCode: String!
    var delegate: LockScreenDelegate!
    
    @IBOutlet weak var titleMessage: UILabel!
    @IBOutlet weak var subtitleMessage: UILabel!
    
    @IBOutlet weak var placeholder1: UIView!
    @IBOutlet weak var placeholder2: UIView!
    @IBOutlet weak var placeholder3: UIView!
    @IBOutlet weak var placeholder4: UIView!
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var touchID: UIButton!
}

// MARK: view initialization

extension LockScreenVC {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        switch (lsm)
        {
            case LockScreenMode.Normal:
                cancel.isHidden = true
            case LockScreenMode.New:
                self.updateTitle(title: NSLocalizedString("new_passcode", comment: "Enter new passcode"))
                self.updateSubtitle(subtitle: NSLocalizedString("new_passcode_proceed", comment: "Enter new passcode to proceed"))
            case LockScreenMode.Change:
                self.updateTitle(title: NSLocalizedString("new_passcode", comment: "Enter new passcode"))
                self.updateSubtitle(subtitle: NSLocalizedString("new_passcode_proceed", comment: "Enter new passcode to proceed"))
            case LockScreenMode.Verification:
                cancel.isHidden = true
            default: break
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        let isModeNormal = (lsm == LockScreenMode.Normal)
        if isModeNormal && delegate.didAllowTouchID!(lockScreen: self)
        {
            self.authenticateWithTouchID()
        }
    }
}

// MARK: Touch ID

extension LockScreenVC {
    func authenticateWithTouchID()
    {
        let reason = NSLocalizedString("touch_id_required_end_session", comment: "Authentication is needed to prevent your child from ending his game session")
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async
                {
                    if success
                    {
                        self.delegate.didEnterCorrectLockCode!()
                    }
                    else
                    {
                        self.presentErrorPopup()
                    }
                }
            }
        }
        else
        {
            self.presentNotAvailableErrorPopup()
        }
    }
}

extension LockScreenVC {
    func isLockCodeValid(lockCode: String) -> Bool
    {
        if lsm == LockScreenMode.Verification
        {
            return confirmCode == lockCode
        }
        
        return self.delegate.lockScreenViewController!(lockScreen: self, lockCode: lockCode)
    }
    
    func updateTitle(title: String)
    {
        self.titleMessage.text = title
    }
    
    func updateSubtitle(subtitle: String)
    {
        self.subtitleMessage.text = subtitle
    }
    
    func unlockSuccessfulUsingLockCode(lockCode: String)
    {
        self.delegate.didEnterCorrectLockCode!(lockCode: lockCode)
    }
    
    func unlockFailed()
    {
        self.delegate.didEnterWrongLockCode!()
    }
}

// MARK: Alert

extension LockScreenVC {
    func presentErrorPopup()
    {
        let alertController = UIAlertController(title: NSLocalizedString("authentication_issue", comment: "Authentication failed"), message: NSLocalizedString("authentication_failed", comment: "We failed to find the account associated with this fingerprint"), preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "OK"), style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    func presentNotAvailableErrorPopup()
    {
        let alertController = UIAlertController(title: NSLocalizedString("touch_id_not_available", comment: "Touch ID not available"), message: NSLocalizedString("device_not_configured", comment: "Your device is not configured for Touch ID."), preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "OK"), style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

extension LockScreenVC {
    func lockScreenViewController(lockScreen: LockScreenVC, lockCode: String)
    {
        if lsm == LockScreenMode.Normal
        {
            if self.isLockCodeValid(lockCode: lockCode)
            {
                self.unlockSuccessfulUsingLockCode(lockCode: lockCode)
            }
            else
            {
                self.unlockFailed()
            }
        }
        else if (lsm == LockScreenMode.Verification)
        {
            if self.isLockCodeValid(lockCode: lockCode)
            {
                lsm = prevlsm
                self.unlockSuccessfulUsingLockCode(lockCode: lockCode)
            }
            else
            {
                lsm = prevlsm
                self.unlockFailed()
            }
        }
        else
        {
            confirmCode = lockCode
            prevlsm = lsm
            lsm = LockScreenMode.Verification
            
            self.updateTitle(title: NSLocalizedString("confirm_lock_code", comment: "Please confirm your passcode"))
            self.updateSubtitle(subtitle: NSLocalizedString("confirm_lock_code_proceed", comment: "Please confirm your passcode to proceed"))
        }
    }
}

// MARK: Action

extension LockScreenVC {
    
    @IBAction func addNumber(sender: UIButton)
    {
        
    }
    
    @IBAction func deleteNumber(sender: UIButton)
    {
        
    }
    
    @IBAction func cancelPressed(sender: UIButton)
    {
        
    }
    
    @IBAction func touchIDPressed(sender: UIButton)
    {
        
    }
}
