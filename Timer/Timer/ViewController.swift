//
//  ViewController.swift
//  Timer
//
//  Created by 이정동 on 2022/08/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    @IBAction func moveSlider(_ sender: UISlider) {
        mainLabel.text = String(Int(sender.value))
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        mainLabel.text = String(Int(slider.value))
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        slider.value = 30
        mainLabel.text = "초를 선택하세요"
        
    }
    
    func configureUI(){
        slider.maximumValue = 60
        slider.minimumValue = 0
        slider.value = 30
    }
    
    @objc func timerAction() {
        if (slider.value - 1) < 0 {
            timer.invalidate()
            mainLabel.text = "종료"
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }else{
            slider.value -= 1
            mainLabel.text = String(Int(slider.value))
        }
        
    }
    
    
}

