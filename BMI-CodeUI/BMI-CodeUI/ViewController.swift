//
//  ViewController.swift
//  BMI-CodeUI
//
//  Created by 이정동 on 2022/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 메인 스택 뷰
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            mainLabel, heightStackView, weightStackView
        ])
        
        st.axis = .vertical
        st.spacing = 20
        st.alignment = .fill
        st.distribution = .fillEqually
        
        return st
    }()
    
    // MARK: - 메인 라벨
    private var mainLabel: UILabel = {
        let label = UILabel()
        
        label.text = "키와 몸무게를 입력해주세요"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - 키 스택 뷰
    private lazy var heightStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            heightLabel, heightTextField
        ])
        
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fill
        st.spacing = 10
        
        return st
    }()
    
    private var heightLabel: UILabel = {
        let label = UILabel()
        
        label.text = "키"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private var heightTextField: UITextField = {
        let tf = UITextField()
        
        tf.keyboardType = .numbersAndPunctuation
        tf.placeholder = "cm"
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    // MARK: - 몸무게 스택 뷰
    private lazy var weightStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            weightLabel, weightTextField
        ])
        
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fill
        st.spacing = 10
        
        return st
    }()
    
    private var weightLabel: UILabel = {
        let label = UILabel()
        
        label.text = "몸무게"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private var weightTextField: UITextField = {
        let tf = UITextField()
        
        tf.keyboardType = .numbersAndPunctuation
        tf.placeholder = "kg"
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        return tf
    }()

    // MARK: - BMI 계산 버튼
    private var bmiCalcButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("BMI 계산", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.isEnabled = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(bmiCalcButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.delegate = self
        heightTextField.delegate = self
        
        makeUI()
    }

    func makeUI() {
        view.backgroundColor = .lightGray
        
        view.addSubview(stackView)
        view.addSubview(bmiCalcButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        bmiCalcButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 메인 스택 뷰
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            // 메인 라벨 높이
            mainLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // 키, 몸무게 라벨 넓이
            heightLabel.widthAnchor.constraint(equalToConstant: 45),
            weightLabel.widthAnchor.constraint(equalToConstant: 45),
            
            // BMI 계산 버튼
            bmiCalcButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bmiCalcButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bmiCalcButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            bmiCalcButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }

    @objc func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let weight = Double(weightTextField.text!),
            let height = Double(heightTextField.text!)
        else{
            bmiCalcButton.backgroundColor = .lightGray
            bmiCalcButton.isEnabled = false
            return
        }
        bmiCalcButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        bmiCalcButton.isEnabled = true
    }
    
    @objc func bmiCalcButtonTapped() {
        let bmiVC = BMIResultVC()
        
        bmiVC.weight = Double(weightTextField.text!)
        bmiVC.height = Double(heightTextField.text!)
        
        present(bmiVC, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" || string == "." {
            return true     // 입력 허용
        }else {
            return false    // 입력 불가
        }
    }
    
    // 엔터 클릭 시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두 개의 텍스트 필드를 모두 종료 (키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두 번째 텍스트 필드로 넘어가도록
        }else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }else {
            return false
        }
    }
}
