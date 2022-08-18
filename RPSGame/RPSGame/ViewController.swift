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
    
    let rpsImages: [UIImage] = [#imageLiteral(resourceName: "scissors"), #imageLiteral(resourceName: "rock"), #imageLiteral(resourceName: "paper")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        let btnTitle: String! = sender.title(for: .normal)
        
        switch btnTitle{
        case "가위" :
            myImageView.image = rpsImages[0]
            myChoiceLabel.text = "가위"
        case "바위" :
            myImageView.image = rpsImages[1]
            myChoiceLabel.text = "바위"
        case "보" :
            myImageView.image = rpsImages[2]
            myChoiceLabel.text = "보"
        default : return

        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        comImageView.image = rpsImages.randomElement()
        let comImage = comImageView.image
        let myImage = myImageView.image
        
        switch comImageView.image{
        case rpsImages[0] : comChoiceLabel.text = "가위"
        case rpsImages[1] : comChoiceLabel.text = "바위"
        case rpsImages[2] : comChoiceLabel.text = "보"
        default : return
        }

        if (comImage == myImage){
            mainLabel.text = "비겼습니다"
        }else if(
            (comImage == rpsImages[0] && myImage == rpsImages[1]) ||
            (comImage == rpsImages[1] && myImage == rpsImages[2]) ||
            (comImage == rpsImages[2] && myImage == rpsImages[0])
        ){
            mainLabel.text = "이겼습니다"
        }else{
            mainLabel.text = "졌습니다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        mainLabel.text = "선택하세요"
        myChoiceLabel.text = "준비"
        comChoiceLabel.text = "준비"
    }
    
    
}

