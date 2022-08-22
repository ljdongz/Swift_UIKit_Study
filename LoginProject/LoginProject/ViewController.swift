//
//  ViewController.swift
//  LoginProject
//
//  Created by 이정동 on 2022/08/21.
//

import UIKit

// 상속을 못하도록 막아 메소드가 다이렉트 디스패치가 되도록 함
final class ViewController: UIViewController {
    
    private let textViewHeight: CGFloat = 48
    
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor
        .constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel
        .centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    // MARK: - 이메일 입력하는 텍스트 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        // addSubview 순서 중요
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        
        return view
    }()
    
    // 로그인 - 이메일 입력 필드
    private var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none // 대문자로 시작
        tf.autocorrectionType = .no // 틀린 단어 자동 변경
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        return tf
    }()

    // 텍스트 필드 내 "이메일 또는 전화번호" 안내문구
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        
        return view
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    // 패스워드 텍스트필드 안내 문구
    private var passwordInfoLabel: UILabel = {
        let label =  UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    // 패스워드 필드에 "표시"버튼 비밀번호 가리기 기능
    private let passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
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
    
    // MARK: - 비밀번호 재설정 버튼
    private let passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        makeUI()
    }
    
    // MARK: - 오토레이아웃 설정
    func makeUI() {
        
        view.backgroundColor = .black
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // "이메일 또는 전화번호" 라벨
            emailInfoLabel.leadingAnchor
                .constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor
                .constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            //emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor), // 고정
            emailInfoLabelCenterYConstraint, // 수정 가능
            
            // 이메일 입력 필드
            emailTextField.leadingAnchor
                .constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor
                .constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailTextField.topAnchor
                .constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor
                .constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            
            // "패스워드" 라벨
            passwordInfoLabel.leadingAnchor
                .constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor
                .constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            //passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor), // 고정
            passwordInfoLabelCenterYConstraint, // 수정 가능
            
            // 패스워드 입력 필드
            passwordTextField.topAnchor
                .constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor
                .constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            passwordTextField.leadingAnchor
                .constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor
                .constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // 패스워드 "표시" 버튼
            passwordSecureButton.topAnchor
                .constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor
                .constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor
                .constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // 스택 뷰
            //stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            // 비밀번호 재설정 버튼
            passwordResetButton.topAnchor
                .constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor
                .constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor
                .constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor
                .constraint(equalToConstant: textViewHeight)
            
        ])

    }
    
    // MARK: - @objc passwordSecureModeSetting()
    @objc func passwordSecureModeSetting() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    // MARK: - @objc resetButtonTapped()
    @objc func resetButtonTapped() {
        let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼 눌림")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소 버튼 눌림")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 다음 화면으로 넘어가는 메서드
        present(alert, animated: true) {
            print("비밀번호 재설정 버튼 눌림")
        }
    }
    

    // MARK: - @objc textFieldEditingChanged()
    @objc func textFieldEditingChanged(textField: UITextField) {
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
    
    @objc func loginButtonTapped() {
        print("로그인 버튼이 눌림")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


// MARK: - 뷰컨트롤 텍스트필드 델리게이트
extension ViewController: UITextFieldDelegate {
    
    // 텍스트필드의 입력이 시작될 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트 (텍스트필드 뷰의 y축 중앙에서 위로 13만큼 이동)
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
