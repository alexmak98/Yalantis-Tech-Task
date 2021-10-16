//
//  SettingsViewController.swift
//  Makovetskyi Tech Task
//
//  Created by Alex Makovetskiy on 12.10.2021.
//

import UIKit

protocol SettingsDelegate {
    var hardcodedAnswers: [String] {get set}
}

class SettingsViewController: UIViewController {
    
    var delegate: SettingsDelegate?
    
    @IBOutlet weak var userAnswerTextField: UITextField!
    
    @IBAction func addAnswerButtonPressed(_ sender: UIButton) {
        delegate?.hardcodedAnswers.append(userAnswerTextField.text!)
        userAnswerTextField.text = ""
        userAnswerTextField.placeholder = "Answer added!"
    }
}
