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
    
    var comChoice: Rps!
    var myChoice: Rps = .rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        let btnTitle = sender.currentTitle
        mainLabel.text = "선택 중..."
        switch btnTitle{
        case "가위" :
            myChoice = .scissors
            myImageView.image = UIImage(named: "scissors")
            myChoiceLabel.text = "가위"
        case "바위" :
            myChoice = .rock
            myImageView.image = UIImage(named: "rock")
            myChoiceLabel.text = "바위"
        case "보" :
            myChoice = .paper
            myImageView.image = UIImage(named: "paper")
            myChoiceLabel.text = "보"
        default : break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        comChoice = Rps(rawValue: Int.random(in: 0...2))
        
        switch comChoice{
        case .rock :
            comImageView.image = UIImage(named: "rock")
            comChoiceLabel.text = "바위"
        case .scissors :
            comImageView.image = UIImage(named: "scissors")
            comChoiceLabel.text = "가위"
        case .paper :
            comImageView.image = UIImage(named: "paper")
            comChoiceLabel.text = "보"
        default: break
        }
        
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
        mainLabel.text = "선택하세요"
        myImageView.image = UIImage(named: "ready")
        comImageView.image = UIImage(named: "ready")
        myChoiceLabel.text = "준비"
        comChoiceLabel.text = "준비"
    }
    
    
}

