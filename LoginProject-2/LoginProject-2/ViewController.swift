//
//  ViewController.swift
//  LoginProject-2
//
//  Created by 이정동 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var emailTextFieldView: UIView!
    @IBOutlet weak var passwordTextFieldView: UIView!
    
    @IBOutlet weak var emailInfoLabel: UILabel!
    @IBOutlet weak var passwordInfoLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor
        .constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel
        .centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailInfoLabelCenterYConstraint.isActive = true
        passwordInfoLabelCenterYConstraint.isActive = true
        
    }
    
    @IBAction func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else{
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
}

extension ViewController: UITextFieldDelegate {
    // 텍스트필드의 입력이 시작될 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙에서 위로 13만큼 이동)
            //emailInfoLabelCenterYConstraint.constant = -13
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙에서 위로 13만큼 이동)
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        // 오토레이아웃이 변경될 때 실행
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
            
            /*
            self.emailTextFieldView.layoutIfNeeded()
            self.passwordTextFieldView.layoutIfNeeded()
            */
        }
    }
    
    // 텍스트필드의 입력이 끝날 때
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            if textField.text != "" { return }
            emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙으로 이동)
            emailInfoLabelCenterYConstraint.constant = 0
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            if textField.text != "" { return }
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙으로 이동)
            passwordInfoLabelCenterYConstraint.constant = 0
        }
        
        // 오토레이아웃이 변경될 때 실행
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
}
