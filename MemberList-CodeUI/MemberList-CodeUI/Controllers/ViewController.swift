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
    
    private let memberListManager = MemberListManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupTableView()
        setupNavigationBar()
        setupTableViewConstraints()
    }
    
    func setupData() {
        memberListManager.makeMembersListData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped))
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
                .constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func barButtonTapped() {
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

