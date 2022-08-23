//
//  ViewController.swift
//  Timer-CodeUI
//
//  Created by 이정동 on 2022/08/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    
    private lazy var mainStackView: UIStackView = {
       let st = UIStackView(arrangedSubviews: [
            timerLabel,
            line1,
            mainLabel,
            stackView,
            line2
       ])
        
        st.axis = .vertical
        st.spacing = 20
        st.distribution = .fill
        st.alignment = .fill
        
        return st
    }()

    private var timerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "타이머"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var line1: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        
        label.text = "초를 선택하세요"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            leftLabel, slider, rightLabel
        ])
        
        st.spacing = 10
        st.distribution = .fill
        st.axis = .horizontal
        st.alignment = .fill
        
        return st
    }()
    
    private var leftLabel: UILabel = {
       let label = UILabel()
        label.text = "0초"
        label.textAlignment = .center
        
        return label
    }()
    
    private var slider: UISlider = {
       let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 60
        slider.value = 30
        slider.addTarget(self, action: #selector(sliderDidEditingChanged), for: .valueChanged)
        
        return slider
    }()
    
    private var rightLabel: UILabel = {
       let label = UILabel()
        label.text = "60초"
        label.textAlignment = .center
        
        return label
    }()
    
    private var line2: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [resetButton, startButton])
        
        st.axis = .horizontal
        st.spacing = 15
        st.distribution = .fillEqually
        st.alignment = .fill
        
        return st
    }()
    
    private var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("RESET", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .green
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .blue
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        makeUI()
    }

    func makeUI(){
        view.addSubview(mainStackView)
        view.addSubview(buttonStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        line1.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        line2.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            mainStackView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor, constant: -10),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 70),
            
            line1.heightAnchor.constraint(equalToConstant: 2),
            line2.heightAnchor.constraint(equalToConstant: 2),
            
            buttonStackView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonStackView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor, constant: -10),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func sliderDidEditingChanged(_ sender: UISlider) {
        mainLabel.text = String(Int(sender.value))
    }
    
    @objc func resetButtonTapped() {
        timer.invalidate()
        slider.value = 30
        mainLabel.text = "초를 선택하세요"
    }
    
    @objc func startButtonTapped() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        if slider.value > 0 {
            slider.value -= 0.1
            mainLabel.text = String(Int(slider.value))
        }else {
            timer.invalidate()
            mainLabel.text = "종료"
            AudioServicesPlaySystemSound(1016)
        }
        
    }
}

