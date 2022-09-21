//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by 이정동 on 2022/09/21.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var todoTextLabel: UILabel!
    
    @IBOutlet weak var dateTextLabel: UILabel!
    
    @IBOutlet weak var updateButton: UIButton!
    
    var todoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 (셀(자신)을 전달)
    var updateButtonPressed: (ToDoCell) -> Void = { (sender) in }
    
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
        updateButtonPressed(self)
    }
    
}
