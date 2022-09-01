//
//  ViewController.swift
//  MemberList-CodeUI
//
//  Created by 이정동 on 2022/09/02.
//

import UIKit

final class ViewController: UIViewController {
    
    // 테이블 뷰 자체는 특별한 기능이 없기 때문에 따로 뷰를 만들지 않음
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        setupTableViewConstraints()
    }

    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

