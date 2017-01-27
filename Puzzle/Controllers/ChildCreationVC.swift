//
//  ChildCreationVC.swift
//  Puzzle
//
//  Created by User on 27/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: iVars & Outlets

class ChildCreationVC: UIViewController {
    var activeField: UITextField!
    var user: User!
    var viewModel: ChildCreationVM!

    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var end: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
}

// MARK: View Initialization

extension ChildCreationVC {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.initView()
        
        self.registerForKeyboardNotifications()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Design initialization

extension ChildCreationVC {
    func initView()
    {
        self.firstname = UITextField.designTextfield(textfield: self.firstname)
        self.lastname = UITextField.designTextfield(textfield: self.lastname)
        self.sex = UITextField.designTextfield(textfield: self.sex)
        self.error = UILabel.designErrorLabel(label: self.error)
        self.add = UIButton.designButton(button: self.add)
        self.end = UIButton.designButton(button: self.end)
        
        if let user = self.user
        {
            if let lastname = user.lastname
            {
                self.lastname.text = lastname
            }
        }
    }
    
    func initDatePicker()
    {
        // TODO: Add a datepicker for birthdate selection
    }
}

// MARK: Action

extension ChildCreationVC {
    @IBAction func addChild(sender: UIButton)
    {
        if let firstname = self.firstname.text, let lastname = self.lastname.text, let email = self.user.email, let sex = self.sex.text, let birthdate = self.birthdate.text, let uid = self.user.uid
        {
            if  String().isNotEmptyNorNil(string: firstname) &&
                String().isNotEmptyNorNil(string: lastname) &&
                String().isNotEmptyNorNil(string: email) &&
                String().isNotEmptyNorNil(string: sex) &&
                String().isNotEmptyNorNil(string: birthdate) &&
                String().isNotEmptyNorNil(string: uid)
            {
                self.viewModel = ChildCreationVM().initWithFirstnameLastnameEmailSexBirthdateUidDelegate(firstname: firstname, lastname: lastname, email: email, sex: sex, birthdate: birthdate, uid: uid, delegate: self) as! ChildCreationVM
                self.viewModel.createChild()
            }
            else
            {
                self.presentErrorPopup()
            }
        }
    }
    
    @IBAction func endCreation(sender: UIButton)
    {
        self.performSegue(withIdentifier: "loadChildSelection", sender: self)
    }
    
    @IBAction func openDatePickerView(sender: AnyObject)
    {
        self.initDatePicker()
    }
}

// MARK: Alert message

extension ChildCreationVC {
    func presentErrorPopup()
    {
        let errorPopup = UIAlertController(title: NSLocalizedString("invalid_values", comment: "Invalid values sent"), message: NSLocalizedString("fill_form_correctly", comment: "Please make sure you filled the present form correctly."), preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "OK"), style: UIAlertActionStyle.cancel) { UIAlertAction in }
        errorPopup.addAction(okAction)
        
        self.present(errorPopup, animated: true, completion: nil)
    }
}

extension ChildCreationVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadChildSelection"
        {
            let childSelection = segue.destination as! ChildSelectionVC
            childSelection.user = self.user
        }
    }
}
