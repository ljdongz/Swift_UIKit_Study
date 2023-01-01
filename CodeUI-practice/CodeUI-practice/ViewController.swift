//
//  ViewController.swift
//  CodeUI-practice
//
//  Created by 이정동 on 2022/12/30.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var box = UIView()
    
//    override func loadView() {
//        
//        view = StackView()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


#if DEBUG

import SwiftUI

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().getPreview()
    }
}

#endif
