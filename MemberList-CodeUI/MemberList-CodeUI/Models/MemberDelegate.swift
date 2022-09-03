//
//  MemberDelegate.swift
//  MemberList-CodeUI
//
//  Created by 이정동 on 2022/09/03.
//

import Foundation

protocol MemberDelegate: AnyObject {
    func addNewMember(_ member: Member)
    func update(index: Int, _ member: Member)
}
