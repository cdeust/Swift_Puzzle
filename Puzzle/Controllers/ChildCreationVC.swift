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
    var userObject: UserObject!
    var viewModel: ChildCreationVM!
    
    @IBOutlet weak var containerBox: UIView!
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.initView()
        self.registerForKeyboardNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Design initialization

extension ChildCreationVC {
    func initView() {
        self.containerBox = UIView.designViewBox(view: self.containerBox)
        self.firstname = UITextField.designTextfield(textfield: self.firstname)
        self.lastname = UITextField.designTextfield(textfield: self.lastname)
        self.birthdate = UITextField.designTextfield(textfield: self.birthdate)
        self.sex = UITextField.designTextfield(textfield: self.sex)
        self.error = UILabel.designErrorLabel(label: self.error)
        self.add = UIButton.designButtonNormal(button: self.add)
        self.end = UIButton.designButtonNormal(button: self.end)
        
        if let user = self.userObject {
            if let lastname = user.lastname {
                self.lastname.text = lastname
            }
        }
    }
    
    func initDatePicker() {
        // TODO: Add a datepicker for birthdate selection
    }
}

// MARK: Action

extension ChildCreationVC {
    @IBAction func addChild(sender: UIButton) {
        if let firstname = self.firstname.text, let lastname = self.lastname.text, let sex = self.sex.text, let birthdate = self.birthdate.text {
            if  String().isNotEmptyNorNil(string: firstname) &&
                String().isNotEmptyNorNil(string: lastname) &&
                String().isNotEmptyNorNil(string: sex) &&
                String().isNotEmptyNorNil(string: birthdate)
            {
                self.viewModel = ChildCreationVM.init(firstname: firstname, lastname: lastname, birthdate: birthdate, sex: sex, userObject: self.userObject, delegate: self)
                self.viewModel.createChild()
            } else {
                self.presentErrorPopup()
            }
        }
    }
    
    @IBAction func endCreation(sender: UIButton) {
        self.performSegue(withIdentifier: "loadChildSelection", sender: self)
    }
    
    @IBAction func openDatePickerView(sender: AnyObject) {
        self.initDatePicker()
    }
}

// MARK: Alert message

extension ChildCreationVC {
    func presentErrorPopup() {
        let errorPopup = UIAlertController(title: NSLocalizedString("invalid_values", comment: "Invalid values sent"), message: NSLocalizedString("fill_form_correctly", comment: "Please make sure you filled the present form correctly."), preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "OK"), style: UIAlertActionStyle.cancel) { UIAlertAction in }
        errorPopup.addAction(okAction)
        
        self.present(errorPopup, animated: true, completion: nil)
    }
}

// MARK: Navigation

extension ChildCreationVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadChildSelection" {
            let childSelection = segue.destination as! ChildSelectionVC
            childSelection.userObject = self.userObject
        }
    }
}
