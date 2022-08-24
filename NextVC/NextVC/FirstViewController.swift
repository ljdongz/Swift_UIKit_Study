//
//  FirstViewController.swift
//  NextVC
//
//  Created by 이정동 on 2022/08/24.
//

import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
    let backButton = UIButton(type: .custom)
    
    // 일반적으로 데이터를 전달받을 때 옵셔널 사용 (생성자를 만들지 않기 위해)
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI(){
        mainLabel.text = someString
        view.backgroundColor = .gray
        
        view.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        
        backButton.setTitle("back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped() {
        // 이전 화면으로 이동
        dismiss(animated: true, completion: nil)
    }

}
