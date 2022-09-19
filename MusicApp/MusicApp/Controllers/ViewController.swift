//
//  ViewController.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    
    var networkManager = NetworkManager.shared
    
    var musicArray: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
        setupData()
    }

    func setupTableView() {
        musicTableView.delegate = self
        musicTableView.dataSource = self
        
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil),forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    func setupData() {
        
        // 콜백함수: 네트워킹 작업이 모두 완료된 이후 작업
        // fetchMusic: 2번 쓰레드(메인 쓰레드가 아닌)에서 실행됨
        networkManager.fetchMusic(searchTerm: "ballad") { result in
            switch result {
            case .success(let musicDatas):
                self.musicArray = musicDatas
                
                // 테이블뷰 새로고침 (메인 쓰레드에서 화면 업데이트)
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MyMusicCell
        
        let musicData = musicArray[indexPath.row]
        
        cell.imageUrl = musicData.imageUrl
        cell.albumNameLabel.text = musicData.albumName
        cell.artistNameLabel.text = musicData.artistName
        cell.songNameLabel.text = musicData.songName
        cell.releaseDateLabel.text = musicData.releaseDateString
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    // 테이블뷰 셀의 높이를 유동적으로 조절할 수 있는 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}
