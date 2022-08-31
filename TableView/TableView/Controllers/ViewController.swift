//
//  ViewController.swift
//  TableView
//
//  Created by 이정동 on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    //var moviesArray: [Movie] = []
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDataManager.makeMovieData()
        //moviesArray = movieDataManager.getMovieData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // tableView Cell의 높이
        tableView.rowHeight = 120
        
        title = "영화 목록"
    }
   
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    // 만들 컨텐츠의 개수 (테이블뷰가 뷰컨트롤러한테 물어봄)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
        let moviesArray = movieDataManager.getMovieData()
        return moviesArray.count
    }
    
    // tableView Cell을 그림
    // n번째 행에 있는 cell의 형태 (테이블뷰가 뷰컨트롤러한테 물어봄)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 화면에 보이는 cell의 개수만큼만 호출 -> 스크롤하면 함수 자동 호출
        print(#function)
        let moviesArray = movieDataManager.getMovieData()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        indexPath.section // 각 그룹
//        indexPath.row // 각 그룹 내 행의 번호
        
        let movie = moviesArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        //cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let movieData = movieDataManager.getMovieData()
            
            let detailVC = segue.destination as! DetailViewController
            
            let indexPath = sender as! IndexPath
            
            // 데이터 전달
            detailVC.movieData = movieData[indexPath.row]
        }
    }
}
