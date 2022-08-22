//
//  ViewController.swift
//  LoginProject-2
//
//  Created by 이정동 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - 이메일 텍스트 필드 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        
        return view
    }()
    
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이메일 주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.textColor = .white
        tf.tintColor = .white
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    // MARK: - 패스워드 텍스트 필드 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecretButton)
        
        return view
    }()
    
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none // 대문자로 시작
        tf.autocorrectionType = .no // 틀린 단어 자동 변경
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true  // 입력 문자 안보이도록
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var passwordSecretButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - 로그인 버튼
    private var loginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .clear
        button.setTitle("로그인", for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.borderWidth = 1
        
        return button
    }()
    
    // MARK: - 스택 뷰
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            emailTextFieldView,
            passwordTextFieldView,
            loginButton
        ])
        st.spacing = 18
        st.axis = .vertical // 세로로 묶음
        st.distribution = .fillEqually
        st.alignment = .fill
        
        return st
    }()
    
    // MARK: - 비밀번호 변경 버튼
    private lazy var passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.tintColor = .white
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        makeUI()
    }

    func makeUI() {
        
        view.backgroundColor = .black
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordSecretButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // emailInfoLabel
            emailInfoLabel.leadingAnchor
                .constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor
                .constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailInfoLabel.centerYAnchor
                .constraint(equalTo: emailTextFieldView.centerYAnchor),
            
            // emailTextField
            emailTextField.topAnchor
                .constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.leadingAnchor
                .constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor
                .constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailTextField.bottomAnchor
                .constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            
            // passwordInfoLabel
            passwordInfoLabel.leadingAnchor
                .constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor
                .constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordInfoLabel.centerYAnchor
                .constraint(equalTo: passwordTextFieldView.centerYAnchor),
            
            // passwordTextField
            passwordTextField.topAnchor
                .constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.leadingAnchor
                .constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor
                .constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordTextField.bottomAnchor
                .constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            
            // passwordSecretButton
            passwordSecretButton.topAnchor
                .constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecretButton.bottomAnchor
                .constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecretButton.trailingAnchor
                .constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // stackView
            stackView.centerYAnchor
                .constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 48 * 3 + 36),
            
            // passwordResetButton
            passwordResetButton.topAnchor
                .constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor
                .constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor
                .constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor
                .constraint(equalToConstant: 48)
        ])
    }
    
    @objc func passwordSecureModeSetting() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func resetButtonTapped() {
        // create the alert
        let alert = UIAlertController(title: "비밀변호 변경", message: "비밀번호를 변경하시겠습니까?", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField) {
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
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙에서 위로 13만큼 이동)
            //emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙에서 위로 13만큼 이동)
            //passwordInfoLabelCenterYConstraint.constant = -13
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            if textField.text != "" { return }
            emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙으로 이동)
            //emailInfoLabelCenterYConstraint.constant = 0
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            if textField.text != "" { return }
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙으로 이동)
            //passwordInfoLabelCenterYConstraint.constant = 0
        }
    }
}
