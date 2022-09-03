//
//  DetailViewController.swift
//  MemberList-CodeUI
//
//  Created by 이정동 on 2022/09/03.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUpdateButtonAction()
        setupData()
    }
    
    func setupData() {
        detailView.member = member
    }
    
    func setupUpdateButtonAction() {
        detailView.updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    @objc func updateButtonTapped() {
        print("버튼 눌림")
    }

}
