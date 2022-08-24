//
//  SecondViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = someString
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // 이전 화면으로 이동
        dismiss(animated: true, completion: nil)
    }
    
}






