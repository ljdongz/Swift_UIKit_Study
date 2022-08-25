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
    
    var bmiManager = BMICalculatorManager()
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        
        bmiManager.calcBMI(height: height!, weight: weight!)
        let bg = bmiManager.getBackgroundColor(BMI: bmiManager.bmi!)
        let adviceStr = bmiManager.getBMIAdviceString(BMI: bmiManager.bmi!)
        
        mainLabel.layer.cornerRadius = 8
        mainLabel.clipsToBounds = true
        mainLabel.text = String(format: "%.2f", bmiManager.bmi!)
        mainLabel.backgroundColor = bg
        subLabel.text = adviceStr
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
