//
//  main.swift
//  RandomBingoCLI
//
//  Created by 이정동 on 2022/08/18.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0
var userInput: String?

while true {
    userInput = readLine()

    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }else{
            break
        }
    }

    if(computerChoice == myChoice){
        print("Bingo")
        break
    }else if(computerChoice > myChoice){
        print("Up")
    }else{
        print("Down")
    }
}





