//
//  ViewController.swift
//  CodeUI-practice
//
//  Created by 이정동 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
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
