//
//  DiceManager.swift
//  DiceGame
//
//  Created by 이정동 on 2022/08/26.
//

import UIKit

struct DiceManager {
    
    private var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    func getRandomDice() -> UIImage {
        return diceArray.randomElement()!
    }
}
