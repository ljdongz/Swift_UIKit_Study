//
//  ViewController.swift
//  BMI
//
//  Created by 이정동 on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calcButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
    }

    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "bmiResultVC")
                        as! BmiResultVC

        guard let height = Double(heightTextField.text!) else { return }
        guard let weight = Double(weightTextField.text!) else { return }
        
        secondVC.body = Body(weight: weight, height: height)
        
        present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func textFieldEditingChanged(_ textField: UITextField) {
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
            calcButton.backgroundColor = .lightGray
            calcButton.isEnabled = false
            return
        }
        calcButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        calcButton.isEnabled = true

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

