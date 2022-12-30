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
    
    override func loadView() {
        
        view = StackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.backgroundColor = .lightGray
        //
        //        view.addSubview(box)
        //
        //        let yelloView = UIView()
        //        view.addSubview(yelloView)
        //
        //        yelloView.backgroundColor = .yellow
        ////        yelloView.translatesAutoresizingMaskIntoConstraints = false
        ////
        ////        NSLayoutConstraint.activate([
        ////            yelloView.widthAnchor.constraint(equalToConstant: 200),
        ////            yelloView.heightAnchor.constraint(equalToConstant: 200),
        ////            yelloView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ////            yelloView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ////        ])
        //
        //        yelloView.snp.makeConstraints { make in
        //            make.width.height.equalTo(200)
        //            make.centerX.equalTo(self.view)
        //            //make.top.equalTo(view).offset(100)
        //            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        //        }
        //
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
