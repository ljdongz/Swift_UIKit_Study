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
        numberLabel.text = sender.currentTitle
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // numberLabel text의 옵셔널 제거
        if let text = numberLabel.text{
            // numberLabel text가 Int로 치환되는지 확인
            if let curNum = Int(text) {
                currentNumber = curNum
            }else{
                print("숫자 입력 부탁")
                return
            }
        }
        
        if (currentNumber==randomNumber){
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
    }
}

