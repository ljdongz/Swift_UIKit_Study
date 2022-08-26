//
//  Rps.swift
//  RPSGame
//
//  Created by 이정동 on 2022/08/18.
//

import Foundation
import UIKit

enum Rps: Int {
    case rock
    case scissors
    case paper
    case ready
    
    var rpsInfo: (image: UIImage, name: String) {
        switch self {
        case .rock :
            return (#imageLiteral(resourceName: "rock"), "바위")
        case .scissors :
            return (#imageLiteral(resourceName: "scissors"), "가위")
        case .paper :
            return (#imageLiteral(resourceName: "paper"), "보")
        case .ready :
            return (#imageLiteral(resourceName: "ready"), "준비")
        }
    }
}
