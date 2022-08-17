//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 이정동 on 2022/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        myButton.setTitle("버튼", for: .normal)
        mainLabel.text = "반갑습니다"
        
    }
    
}

