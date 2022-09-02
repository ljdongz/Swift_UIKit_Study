//
//  MemberListManager.swift
//  MemberList-CodeUI
//
//  Created by 이정동 on 2022/09/02.
//

import Foundation

final class MemberListManager {
    private var membersList : [Member] = []
    
    func makeMembersListData() {
        membersList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-1981-5622", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-1141-2222", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-1111-2222", address: "캘리포니아"),
            Member(name: "베조스", age: 50, phone: "010-1231-2543", address: "하와이"),
            Member(name: "배트맨", age: 40, phone: "010-1141-2222", address: "고담씨티"),
            Member(name: "조커", age: 40, phone: "010-1685-2222", address: "고담씨티")
        ]
    }
    
    func getMembersList() -> [Member] {
        return membersList
    }
    
    func makeNewMember(_ member: Member) {
        membersList.append(member)
    }
    
    func updateMemberInfo(index: Int, _ member: Member) {
        membersList[index] = member
    }
    
    // 서브스크립트 문법
    // ex) let mList = MemberListManager()
    //     mList[2] -> MemberListManager.memberList[2]
    subscript(index: Int) -> Member {
        get {
            return membersList[index]
        }
    }
}
