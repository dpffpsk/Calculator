//
//  RoundButton.swift
//  Calculator
//
//  Created by won on 2022/08/30.
//

import UIKit

@IBDesignable // 변경된 값 스토리보드에서 실시간으로 확인 가능(스토리보드 열 때마다 빌드 됨)
class RoundButton: UIButton {
    @IBInspectable var isBool: Bool = false{ // 변경된 값 스토리보드에 실시간 반영
        didSet {
            if isBool {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
