//
//  DetailViewController.swift
//  MusicApp
//
//  Created by 이정동 on 2022/10/12.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = someString
        // Do any additional setup after loading the view.
    }

}
