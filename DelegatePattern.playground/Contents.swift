import UIKit

// 자격증 정의
protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}

// 리모콘 클래스 (위임자를 갖는 객체의 역할)
// ex) TextField
class RemoteControl {
    
    // RemoteControlDelegate 채택하기 위한 변수
    var delegate: RemoteControlDelegate?
    
    func doSomething(){
        print("리모콘 조작 중")
    }
    
    // 채널 증가 시 대리자(delegate)의 channelUp 메서드 호출
    // 요구 사항(channelUp)을 대리자한테 전달
    func channelUp(){
        delegate?.channelUp()
    }
    // 채널 감소 시 대리자(delegate)의 channelDown 메서드 호출
    // 요구 사항(channelDown)을 대리자한테 전달
    func channelDown(){
        delegate?.channelDown()
    }
}

// TV 클래스 (위임자를 전달 받는 객체의 역할 - 리모콘과 커뮤니케이션)
// ex) ViewController
class TV: RemoteControlDelegate {
    
    // 상속받은 프로토콜의 메서드를 구현
    // 필수적인 요구 사항 구현
    func channelUp(){
        print("TV 채널번호 증가")
    }
    func channelDown(){
        print("TV 채널번호 감소")
    }
}


let tvRemote = RemoteControl()
let samsungTV = TV()

// 리모콘의 대리자를 TV로 설정
tvRemote.delegate = samsungTV
tvRemote.channelUp()
tvRemote.channelDown()


// SmartPhone 클래스 (위임자를 전달받는 객체의 역할 - 리모콘과 커뮤니케이션)
// ex) ViewController 역할
class SmartPhone: RemoteControlDelegate {
    init(remote: RemoteControl){
        // 리모콘(remote)의 대리자를 자신(SmartPhone)으로 설정
        remote.delegate = self
    }
    
    func channelUp() {
        print("스마트폰 채널 증가")
    }
    func channelDown() {
        print("스마트폰 채널 감소")
    }
}

let phoneRemote = RemoteControl()
// 스마트폰 객체를 생성하면서 리모콘의 대리자 설정
let smartPhone = SmartPhone(remote: phoneRemote)

phoneRemote.channelUp()
phoneRemote.channelDown()
