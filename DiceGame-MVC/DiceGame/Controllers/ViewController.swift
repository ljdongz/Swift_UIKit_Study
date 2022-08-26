//
//  ViewController.swift
//  DiceGame
//
//  Created by 이정동 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceManager = DiceManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫 번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceManager.getRandomDice()
        
        // 두 번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceManager.getRandomDice()
        
    }
    

}

