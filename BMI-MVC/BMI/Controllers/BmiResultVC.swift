//
//  BmiResultVC.swift
//  BMI
//
//  Created by 이정동 on 2022/08/25.
//

import UIKit

class BmiResultVC: UIViewController {

    var body: Body?
    
    var bmiManager = BMICalculatorManager()
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        
        bmiManager.calcBMI(height: body!.height, weight: body!.weight)
        let bmi = bmiManager.getBMI()
        let bg = bmiManager.getBackgroundColor(BMI: bmi)
        let adviceStr = bmiManager.getBMIAdviceString(BMI: bmi)
        
        mainLabel.layer.cornerRadius = 8
        mainLabel.clipsToBounds = true
        mainLabel.text = String(format: "%.2f", bmi)
        mainLabel.backgroundColor = bg
        subLabel.text = adviceStr
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
