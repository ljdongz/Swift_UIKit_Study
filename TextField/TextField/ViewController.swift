//
//  ViewController.swift
//  TextField
//
//  Created by 이정동 on 2022/08/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        // view = Safe Area와 Stack View를 포함하는 View
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email Address"
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    
}

