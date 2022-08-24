//
//  ViewController.swift
//  BMI
//
//  Created by 이정동 on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "bmiResultVC")
                        as! BmiResultVC

        guard let height = Double(heightTextField.text!) else { return }
        guard let weight = Double(weightTextField.text!) else { return }
        
        secondVC.height = height
        secondVC.weight = weight
        
        present(secondVC, animated: true, completion: nil)
    }
    

}

