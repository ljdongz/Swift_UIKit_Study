//
//  UIView+Ext.swift
//  UIKit-CodeUI-Preview
//
//  Created by 이정동 on 2022/10/11.
//

import Foundation
import UIKit


// 디버그일때만 처리
#if DEBUG
import SwiftUI

extension UIView {
    private struct ViewRepresentable : UIViewRepresentable {
        
        let uiview : UIView
        
        // 상태가 변경될 때 업데이트
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
        
        func makeUIView(context: Context) -> some UIView {
            return uiview
        }
    }
    
    // 미리보기를 가져옴
    func getPreview() -> some View {
        ViewRepresentable(uiview: self)
    }
}

#endif
