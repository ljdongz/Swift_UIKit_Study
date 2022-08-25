//
//  BMICalculateManager.swift
//  BMI
//
//  Created by 이정동 on 2022/08/26.
//

import Foundation
import UIKit

struct BMICalculatorManager {
    
    var bmi: Double?
    
    func getBMIAdviceString(BMI: Double) -> String {
        if BMI < 18.5 {
            return "저체중 입니다"
        }else if BMI < 23{
            return "정상 입니다"
        }else if BMI < 25 {
            return "과체중 입니다"
        }else {
            return "비만 입니다"
        }
    }
    
    func getBackgroundColor(BMI: Double) -> UIColor {
        
        if BMI < 18.5 {
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }else if BMI < 23{
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }else if BMI < 25 {
            return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }else {
            return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    mutating func calcBMI(height: Double, weight: Double) {
        bmi = weight / (height * height / 10000)
    }
}
