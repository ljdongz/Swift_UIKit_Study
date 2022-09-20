//
//  ViewController.swift
//  MusicApp
//
//  Created by 이정동 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    
    //let searchController = UISearchController()
    
    
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    var networkManager = NetworkManager.shared
    
    var musicArray: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupSearchBar()
        setupTableView()
        setupData()
    }
    
    func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        
        // 1) (단순)서치바 사용
//        searchController.searchBar.delegate = self
        
        // 2) 서치(결과)컨트롤러 사용 (복잡한 구현 가능)
        //      -> 글자마다 검색 기능 + 새로운 화면을 보여주는 기능
        searchController.searchResultsUpdater = self
        
        // 첫 글자 대문자 설정 제거
        searchController.searchBar.autocapitalizationType = .none
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

extension ViewController: UISearchBarDelegate {
//
//    // 유저가 글자를 입력하는 순간마다 호출되는 메서드
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        print(searchText)
//        // 다시 빈 배열로 만들기 ⭐️
//        self.musicArray = []
//
//        // 네트워킹 시작
//        networkManager.fetchMusic(searchTerm: searchText) { result in
//            switch result {
//            case .success(let musicDatas):
//                // 검색 결과를 배열에 담음
//                self.musicArray = musicDatas
//                DispatchQueue.main.async {
//                    self.musicTableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    // 검색(Search) 버튼을 눌렀을때 호출되는 메서드
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        // 서치바에 입력된 텍스트
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//        print(text)
//        // 다시 빈 배열로 만들기 ⭐️
//        self.musicArray = []
//
//        // 네트워킹 시작
//        networkManager.fetchMusic(searchTerm: text) { result in
//            switch result {
//            case .success(let musicDatas):
//                self.musicArray = musicDatas
//                DispatchQueue.main.async {
//                    self.musicTableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        // 키보드 내려감
//        self.view.endEditing(true)
//    }
}

extension ViewController: UISearchResultsUpdating {
    // 유저가 글자를 입력할 때 마다 호출
    // 일반적으로 다른 화면(컬렉션뷰)을 보여줄 때 구현
    func updateSearchResults(for searchController: UISearchController) {
        // 검색하는 동안 다른 화면(컬렉션뷰)을 보여줌
        let vc = searchController.searchResultsController as! SearchResultViewController
        // 컨트롤러에 데이터 전달
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
    
    
}
