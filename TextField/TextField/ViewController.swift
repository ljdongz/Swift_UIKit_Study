//
//  ViewController.swift
//  TextField
//
//  Created by 이정동 on 2022/08/19.
//

import UIKit

// UITextFieldDelegate 상속 : ViewController한테 텍스트필드 대리자 자격을 부여
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // textField의 대리자(deletgate)를 ViewController로 설정
        textField.delegate = self
        
        // 화면 터치 시 키보드 내려감
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupUI()
    }
    
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        // 첫 번째로 포커스된 텍스트필드를 해임
        textField.resignFirstResponder()
    }
    
    
    func setupUI(){
        // view = Safe Area와 Stack View를 포함하는 View
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email Address"
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        
        // 화면에서 텍스트필드가 첫 번째로 반응하도록 설정 (키보드가 자동으로 올라옴)
        // 유저한테 먼저 반응할 것을 포커스 시켜줌
        textField.becomeFirstResponder()
         
    }
    
    // 필수 또는 선택적으로 설정해야 하는 delegate 요소
    
    // 1. 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부를 허락) - 선택
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) // 함수가 호출될 때 함수의 이름 출력
        return true
    }
    
    // 2. 텍스트필드의 입력이 시작되는 시점 - 선택
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작")
    }
    
    // 3. 텍스트필드의 내용을 지울 수 있는지의 여부를 결정 - 선택
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 4. 텍스트필드에 한글자 한글자 입력되거나 지워질 때 호출이 되도록 허락 - 선택
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 5 // 입력 가능한 글자 수
        
    }
    
    // 5. 텍스트필드의 엔터가 눌러지면 다음 동작을 허락할 것인지 말것인지 - 선택
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        // 첫 번째로 포커스된 텍스트필드를 해임
        textField.resignFirstResponder()
        return true
    }
    
    // 6. 텍스트필드의 입력이 끝날지 말지를 결정 - 선택
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝날 때 호출 - 선택
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("텍스트필드 입력 종료")
    }
}

