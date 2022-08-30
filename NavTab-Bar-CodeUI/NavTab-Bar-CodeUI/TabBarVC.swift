//
//  TabBarVC.swift
//  NavTab-Bar-CodeUI
//
//  Created by 이정동 on 2022/08/30.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = SecondViewController()
        
        // 네비게이션 타이틀 크기
        vc1.navigationItem.largeTitleDisplayMode = .automatic
        vc2.navigationItem.largeTitleDisplayMode = .automatic
    
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "person"), selectedImage: nil)
        vc2.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "trash"), selectedImage: nil)
        
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
        
        self.setViewControllers([vc1, vc2], animated: false)
    }


}
