//
//  ViewController.swift
//  ToDoApp
//
//  Created by 이정동 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let toDoManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationBar()
    }
    
    // 화면에 다시 진입할 때 마다 테이블뷰 리로드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    func setupNavigationBar() {
        title = "메모"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func plusButtonTapped() {
        performSegue(withIdentifier: "ToDoCell", sender: nil)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoManager.getToDoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        // 셀에 모델(ToDoData) 전달
        let toDoData = toDoManager.getToDoListFromCoreData()
        cell.todoData = toDoData[indexPath.row]
        
        // 셀위에 있는 버튼이 눌렸을때 (뷰컨트롤러에서) 어떤 행동을 하기 위해서 클로저 전달
        // 1) ToDoCell.updateButtonPressed에 사용할 클로저 전달
        //     -> 각각의 ToDoCell.updateButtonPressed 변수에 performSegue 함수를 실행하는 클로저 저장
        cell.updateButtonPressed = { [weak self] in
            // 뷰컨트롤러에 있는 세그웨이의 실행
            self?.performSegue(withIdentifier: "ToDoCell", sender: indexPath)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    // Delegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "ToDoCell", sender: indexPath)
//    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDoCell" {
            let detailVC = segue.destination as! DetailViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.toDoData = toDoManager.getToDoListFromCoreData()[indexPath.row]
        }
    }
}


