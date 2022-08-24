//
//  BmiResultVC.swift
//  BMI
//
//  Created by 이정동 on 2022/08/25.
//

import UIKit

class BmiResultVC: UIViewController {

    var height: Double?
    var weight: Double?
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let BMI = calcBMI(height: height!, weight: weight!)
        
        mainLabel.text = String(format: "%.2f", BMI)
        
        if BMI < 18.5 {
            mainLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            subLabel.text = "저체중 입니다"
        }else if BMI < 23{
            mainLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            subLabel.text = "정상 입니다"
        }else if BMI < 25 {
            mainLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            subLabel.text = "과체중 입니다"
        }else {
            mainLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            subLabel.text = "비만 입니다"
        }
    }
    
    func makeUI() {
        mainLabel.layer.cornerRadius = 8
        mainLabel.clipsToBounds = true
    }
    
    func calcBMI(height: Double, weight: Double) -> Double {
        
        return weight / (height * height / 10000)
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
