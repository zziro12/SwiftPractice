//
//  CircleButton.swift
//  stackViewPractice
//
//  Created by Jinho Choi on 2020/09/10.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import Foundation
import UIKit

// 인터페이스 빌더에서 디자인으로 확인 가능하게끔 IBDesignable
@IBDesignable
class CircleButton: UIButton {
    
    //@IBInspectable 인스팩터패널에서 사용할 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
