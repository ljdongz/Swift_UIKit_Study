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
    
    let memberListManager = MemberListManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupTableView()
        setupNavigationBar()
        setupTableViewConstraints()
        
        title = "회원 목록"
    }
    
    func setupData() {
        memberListManager.makeMembersListData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        
        tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberCell")
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
        let detailVC = DetailViewController()
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberTableViewCell
        
        // MemberListManager에서 subScript를 구현했기 때문에 MemberListManager객체에서 인덱스 접근을 통해 membersList에 접근 가능
//        let member = memberListManager[indexPath.row]
//        cell.mainImageView.image = member.memberImage
//        cell.memberNameLabel.text = member.name
//        cell.addressLabel.text = member.address
        
        // 속성 감시자 사용
        cell.member = memberListManager[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        let member = memberListManager[indexPath.row]
        
        detailVC.member = member
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
