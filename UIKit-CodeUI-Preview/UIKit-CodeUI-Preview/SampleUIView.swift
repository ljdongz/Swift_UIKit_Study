//
//  SampleUIView.swift
//  UIKit-CodeUI-Preview
//
//  Created by 이정동 on 2022/10/12.
//

import Foundation
import UIKit

class SampleUIView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = .blue
    }
}

#if DEBUG

import SwiftUI

struct SampleUIView_Previews: PreviewProvider {
    static var previews: some View {
        SampleUIView().getPreview()
    }
}

#endif
