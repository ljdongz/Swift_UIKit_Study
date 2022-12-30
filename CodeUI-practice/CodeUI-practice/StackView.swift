//
//  StackView.swift
//  CodeUI-practice
//
//  Created by 이정동 on 2022/12/30.
//

import UIKit
import SnapKit

class StackView: UIView {
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topStackView)
        
        topStackView.addArrangedSubview(makeView())
        topStackView.addArrangedSubview(makeView())
        
        
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(130)
            make.left.equalTo(self).offset(20)
            make.centerX.equalTo(self)
        }
        
        
        
        let third = makeView()
        
        let image = UIImageView(image: UIImage(systemName: "person"))
        third.addSubview(image)
        topStackView.addArrangedSubview(third)
        
        image.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().offset(-20)
            make.width.height.equalTo(25)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StackView {
    fileprivate func makeView() -> UIView {
        
        lazy var firstView: UIView = {
            let view = UIView()
            view.backgroundColor = .yellow
            return view
        }()
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "사운드\n테라피"
            label.numberOfLines = 2
            
            return label
        }()
        
        lazy var subTitleLabelBg: UIView = {
            let view = UIView()
            view.backgroundColor = .systemMint
            return view
        }()
        
        lazy var subTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "무료"
            
            return label
        }()
        
        
        firstView.addSubview(titleLabel)
        firstView.addSubview(subTitleLabelBg)
        
        subTitleLabelBg.addSubview(subTitleLabel)
        
        firstView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
        }
        
        subTitleLabelBg.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(titleLabel)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.center.equalTo(subTitleLabelBg)
            make.top.left.equalTo(subTitleLabelBg).offset(5)
        }
        
        return firstView
    }
}


#if DEBUG

import SwiftUI

struct SampleUIView_Previews: PreviewProvider {
    static var previews: some View {
        StackView().getPreview()
    }
}

#endif
