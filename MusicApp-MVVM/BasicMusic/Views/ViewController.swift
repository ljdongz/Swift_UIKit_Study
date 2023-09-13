//
//  ViewController.swift
//  BasicMusic
//
//  Created by Allen H on 2022/12/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var viewModel = MusicViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        // output 동작
        self.viewModel.music.bind { [weak self] music in
            DispatchQueue.main.async {
                self?.albumNameLabel.text = music.albumName
                self?.songNameLabel.text = music.songName
                self?.artistNameLabel.text = music.artistName
            }
        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // input
        viewModel.handleStartButtonTapped()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        // input
        viewModel.handleStopButtonTapped()
    }
    
}

