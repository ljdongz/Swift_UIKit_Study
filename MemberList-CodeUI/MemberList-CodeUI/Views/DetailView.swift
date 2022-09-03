//
//  DetailView.swift
//  MemberList-CodeUI
//
//  Created by 이정동 on 2022/09/03.
//

import UIKit

class DetailView: UIView {
    
    private var mainStackViewTopConstraint: NSLayoutConstraint!
    private let labelWidth: CGFloat = 70
    
    var member: Member? {
        didSet{
            guard let member = member else {
                // 멤버가 없는 경우 (즉, 새로운 멤버를 추가할 때의 상황)
                // 멤버가 없으면 버튼을 "SAVE"로 세팅
                updateButton.setTitle("SAVE", for: .normal)
                // 멤버가 없으면(새로운 멤버를 추가하는 상황), 타입 저장 속성의 현재 숫자 가져오기
                memberIdTextField.text = "\(Member.memberNumber)"
                return
            }
            
            // 멤버가 있을 경우
            mainImageView.image = member.memberImage
            memberIdTextField.text = "\(member.memberId)"
            memberNameTextField.text = member.name
            memberPhoneTextField.text = member.phone
            memberAddressTextField.text = member.address
            
            if let age = member.age {
                memberAgeTextField.text = "\(age)"
            }else {
                memberAgeTextField.text = ""
            }
            
        }
    }
    
    // MARK: - 이미지
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 75
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    lazy var imageContainView: UIView = {
        let view = UIView()
        
        view.addSubview(mainImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Member ID
    let memberIdLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "멤버번호:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let memberIdTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.isEnabled = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var memberIdStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberIdLabel, memberIdTextField])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - Member Name
    let memberNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "이   름:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let memberNameTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var memberNameStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberNameLabel, memberNameTextField])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - Member Age
    let memberAgeLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "나   이:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let memberAgeTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var memberAgeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberAgeLabel, memberAgeTextField])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - Member phone
    let memberPhoneLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "전화번호:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let memberPhoneTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var memberPhoneStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberPhoneLabel, memberPhoneTextField])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - Member Address
    let memberAddressLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "주   소:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let memberAddressTextField: UITextField = {
        let tf = UITextField()
        
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var memberAddressStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberAddressLabel, memberAddressTextField])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var updateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("UPDATE", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            imageContainView,memberIdStackView, memberAgeStackView,
            memberNameStackView, memberPhoneStackView, memberAddressStackView, updateButton
        ])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupStackView()
        setupNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        addSubview(mainStackView)
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setupNotification() {
        // 키보드가 올라올 때 알림을 받을 수 있도록 Notification 설정
        NotificationCenter.default
            .addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default
            .addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setConstraints() {
        mainStackViewTopConstraint = mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        NSLayoutConstraint.activate([
            // mainImageView
            mainImageView.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 150),
            mainImageView.widthAnchor.constraint(equalToConstant: 150),
            
            // imageContainView
            imageContainView.heightAnchor.constraint(equalToConstant: 180),
            
            // 각 Member 정보 Stack View
//            memberIdStackView.heightAnchor.constraint(equalToConstant: 40),
//            memberAgeStackView.heightAnchor.constraint(equalToConstant: 40),
//            memberNameStackView.heightAnchor.constraint(equalToConstant: 40),
//            memberPhoneStackView.heightAnchor.constraint(equalToConstant: 40),
//            memberAddressStackView.heightAnchor.constraint(equalToConstant: 40),
            
//            updateButton.heightAnchor.constraint(equalToConstant: 40),
            
            // 각 labelWidth
            memberIdLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberNameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberAddressLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberAgeLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberPhoneLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            // mainStackView
            
            mainStackViewTopConstraint,
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
//            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc func moveUpAction() {
        mainStackViewTopConstraint.constant = -20
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownAction() {
        mainStackViewTopConstraint.constant = 10
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}
