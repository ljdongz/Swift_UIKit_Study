//
//  CustomView.swift
//  StoryBoard-tutorial
//
//  Created by 이정동 on 2022/10/13.
//

import Foundation
import UIKit

@IBDesignable // 인터페이스 빌더에서 디자인 확인이 가능
class CustomView : UIView {
    
    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var isCircle : Bool = false {
        didSet {
            if isCircle {
                self.layer.cornerRadius = self.frame.width / 2
            }
        }
    }
}
