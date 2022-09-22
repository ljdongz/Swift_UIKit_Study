//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by 이정동 on 2022/09/21.
//

import UIKit

//protocol UpdateButtonProtocol: AnyObject {
//    func updateButtonTapped(cell: ToDoCell)
//}


class ToDoCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var todoTextLabel: UILabel!
    
    @IBOutlet weak var dateTextLabel: UILabel!
    
    @IBOutlet weak var updateButton: UIButton!
    
    
    //weak var delegate: UpdateButtonProtocol?
    
    
    var todoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 옵셔널 타입 대신 초기값을 설정
    // 2) ViewController에서 클로저 전달 받음
    var updateButtonPressed: () -> Void = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // bgView, button cornerRadius 설정
    func configureUI() {
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
    }
    
    // 코어데이터로 UI 표시
    func configureUIwithData() {
        todoTextLabel.text = todoData?.text
        dateTextLabel.text = todoData?.dateString
        
        guard let colorNum = todoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        bgView.backgroundColor = color.backgoundColor
    }
    
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        // 클로저 방식 (self = ToDoCell)
        updateButtonPressed()
        
        // 커스텀 델리게이트 (뷰컨트롤러에서 프로토콜 채택 후 프로토콜 메서드 구현)
        //delegate?.updateButtonTapped(cell: self)
    }
    
}
