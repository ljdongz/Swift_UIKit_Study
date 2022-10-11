//
//  UIViewController+Ext.swift
//  UIKit-CodeUI-Preview
//
//  Created by 이정동 on 2022/10/11.
//

import Foundation
import UIKit


// 디버그일때만 처리
#if DEBUG
import SwiftUI

extension UIViewController {
    private struct VCRepresentable : UIViewControllerRepresentable {
        
        let viewController : UIViewController
        
        // 상태가 변경될 때 업데이트
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
    }
    
    // 미리보기를 가져옴
    func getPreview() -> some View {
        return VCRepresentable(viewController: self)
    }
}

#endif
