//
//  RpsManager.swift
//  RPSGame
//
//  Created by 이정동 on 2022/08/26.
//

import Foundation

struct RpsManager {
    
    private var userChoice = Rps.rock
    
    func getUserChoice() -> Rps {
        return userChoice
    }
    
    func getReady() -> Rps {
        return Rps(rawValue: 3)!
    }
    
    mutating func setUserChoice(rps: Rps) {
        userChoice = rps
    }
    
    func randomRps() -> Rps {
        return Rps(rawValue: Int.random(in: 0...2))!
    }
    
}
