//
//  NumberManager.swift
//  UpDownGame
//
//  Created by 이정동 on 2022/08/26.
//

import Foundation

struct UpDownManager {
    private var randomNumber: Int = Int.random(in: 1...10)
    
    func getRandomNumber() -> Int {
        return randomNumber
    }
    
    mutating func resetRandomNumber() {
        randomNumber = Int.random(in: 1...10)
    }
    
    func checkResultText(number: Int) -> String {
        if (number == randomNumber){
            return "Bingo"
        }else if(number > randomNumber){
            return "Down"
        }else{
            return "Up"
        }
    }
    
    
}
