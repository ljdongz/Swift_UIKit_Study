//
//  Member.swift
//  MemberList-CodeUI
//
//  Created by 이정동 on 2022/09/02.
//

import UIKit




class Member  {
    
    lazy var memberImage: UIImage? = {
        // member의 이름이 존재하면
        if let name = name {
            // member이름의 이미지가 없을 경우 시스템 이미지
            return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
        }else {
            return UIImage(systemName: "person")
        }
    }()
    
    static var memberNumber: Int = 0    // 회원 고유 번호(모든 Member 객체가 공유)
    
    let memberId: Int   // 회원 교유 번호
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String?, age: Int?, phone: String?, address: String?) {

        // 0일때는 0, 0이 아닐때는 타입저장속성의 절대적 값으로 세팅 (자동순번)
        self.memberId = Member.memberNumber

        self.name = name
        self.age = age
        self.phone = phone
        self.address = address

        Member.memberNumber += 1
    }
}
