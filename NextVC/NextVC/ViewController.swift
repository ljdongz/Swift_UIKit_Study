//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    // var storyboard: UIStoryBoard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        
        // firstVC.modalPresentationStyle = .fullScreen // modal style setting
        
        firstVC.someString = "Code Next"
        // firstVC.mainLabel.text = "Code Next"
        // 동작은 되나 사용하지 않는 방식 (스토리보드 UI에서는 오류가 발생)
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        // withIdentifier = Storyboard ID
        // instantiateViewController의 리턴 타입 = UIViewController이므로 사용할 뷰컨트롤러로 타입 캐스팅 필요
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC")
                as! SecondViewController
        
//        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC")
//                as? SecondViewController else { return }
        
        secondVC.someString = "SecondViewController 입니다"
        // secondVC.mainLabel.text = "Second" // Error (secondVC.mainLabel이 메모리에 올라가기 전 상태에서 접근하려 하기 때문)
        
        present(secondVC, animated: true, completion: nil)
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        // 세그웨이 활성화
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
//        if count == 1 {
//            performSegue(withIdentifier: "toThirdVC", sender: self)
//        } else {
//            count += 1
//        }
    }
    
    // 데이터 전달 메서드 재정의
    // performSegue 실행 시 자동으로 호출됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            
            // 데이터 전달
            thirdVC.someString = "ThirdViewController 입니다"
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            
            // 데이터 전달
            fourthVC.someString = "FourViewController 입니다"
        }
        
    }
    
    var count = 0
    
    // 조건에 따라 세그웨이 실행 여부를 결정
    // 직접 세그웨이에서만 사용 가능
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if count == 1 {
            return true
        }else {
            count += 1
            return false
        }
    }
    
}

