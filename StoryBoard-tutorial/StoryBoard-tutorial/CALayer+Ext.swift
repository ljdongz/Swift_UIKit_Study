//
//  CALayer+Ext.swift
//  StoryBoard-tutorial
//
//  Created by 이정동 on 2022/10/13.
//

import UIKit



extension CALayer {
  func applyShadow(
    color: UIColor = .black, // 그림자 색
    alpha: Float = 0.5,      // 그림자 투명도
    x: CGFloat = 0,          // 가로 위치
    y: CGFloat = 2,          // 세로 위치
    blur: CGFloat = 4,       // 블러
    spread: CGFloat = 0)     // 퍼짐 정도
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
