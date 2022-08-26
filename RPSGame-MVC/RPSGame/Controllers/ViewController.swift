//
//  ViewController.swift
//  RPSGame
//
//  Created by 이정동 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
 
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
//    var comChoice: Rps!
//    var myChoice: Rps = .rock
    
    var rpsManager = RpsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        let btnTitle = sender.currentTitle
        mainLabel.text = "선택 중..."
        
        switch btnTitle{
        case "가위" :
            rpsManager.setUserChoice(rps: .scissors)
        case "바위" :
            rpsManager.setUserChoice(rps: .rock)
        case "보" :
            rpsManager.setUserChoice(rps: .paper)
        default : break
        }
        
        myImageView.image = rpsManager.getUserChoice().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserChoice().rpsInfo.name
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let comChoice = rpsManager.randomRps()
        let myChoice = rpsManager.getUserChoice()
        
        comImageView.image = comChoice.rpsInfo.image
        comChoiceLabel.text = comChoice.rpsInfo.name
        
        if comChoice == myChoice{
            mainLabel.text = "비겼습니다"
        }else if (
            (comChoice == .paper && myChoice == .scissors) ||
            (comChoice == .scissors && myChoice == .rock) ||
            (comChoice == .rock && myChoice == .paper)
        ){
            mainLabel.text = "이겼습니다"
        }else{
            mainLabel.text = "졌습니다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        let ready = rpsManager.getReady()
        
        mainLabel.text = "선택하세요"
        myImageView.image = ready.rpsInfo.image
        comImageView.image = ready.rpsInfo.image
        myChoiceLabel.text = ready.rpsInfo.name
        comChoiceLabel.text = ready.rpsInfo.name
    }
    
    
}

