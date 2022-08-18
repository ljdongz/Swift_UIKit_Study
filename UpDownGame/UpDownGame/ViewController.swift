//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이정동 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var randomNumber: Int = 0
    var currentNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumber = Int.random(in: 1...10)
    }

    
    @IBAction func numButtonTapped(_ sender: UIButton) {
        
        // 입력한 버튼의 숫자를 가져옴
        guard let numString = sender.currentTitle else { return }
        
        // numberLabel text 변경
        numberLabel.text = numString
        
        // 선택한 숫자를 변수에 저장
        guard let num = Int(numString) else { return }
        currentNumber = num
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        if (currentNumber == 0){
            mainLabel.text = "숫자를 입력하세요"
        }else if (currentNumber==randomNumber){
            mainLabel.text = "Bingo"
        }else if(currentNumber > randomNumber){
            mainLabel.text = "Down"
        }else{
            mainLabel.text = "Up"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        randomNumber = Int.random(in: 1...10)
        currentNumber = 0
    }
}

