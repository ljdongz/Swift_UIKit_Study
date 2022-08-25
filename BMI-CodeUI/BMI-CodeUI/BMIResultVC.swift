//
//  BMIResultVC.swift
//  BMI-CodeUI
//
//  Created by 이정동 on 2022/08/25.
//

import UIKit

class BMIResultVC: UIViewController {
    
    var weight: Double?
    var height: Double?
    
    // MARK: - 스택 뷰
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            mainLabel, bmiLabel, infoLabel
        ])
        
        st.axis = .vertical
        st.spacing = 15
        st.distribution = .fill
        st.alignment = .fill
        
        return st
    }()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        
        label.text = "BMI 결과값"
        label.textAlignment = .center
        
        return label
    }()
    
    private var bmiLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("뒤로가기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        
        return button
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        
        
        calcBMI()
    }
    
    // MARK: - makeUI
    func makeUI() {
        view.addSubview(stackView)
        view.addSubview(returnButton)
        
        view.backgroundColor = .lightGray
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 스택 뷰
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            // 라벨 높이
            mainLabel.heightAnchor.constraint(equalToConstant: 35),
            bmiLabel.heightAnchor.constraint(equalToConstant: 50),
            infoLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // 버튼
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            returnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            returnButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            returnButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func calcBMI() {
        guard let w = weight else { return }
        guard let h = height else { return }
        
        let BMI = w / (h * h / 10000)
        
        bmiLabel.text = String(format: "%.2f", BMI)
        
        if BMI < 18.5 {
            bmiLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            infoLabel.text = "저체중 입니다"
        }else if BMI < 23{
            bmiLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            infoLabel.text = "정상 입니다"
        }else if BMI < 25 {
            bmiLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            infoLabel.text = "과체중 입니다"
        }else {
            bmiLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            infoLabel.text = "비만 입니다"
        }
    }
    
    @objc func returnButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

