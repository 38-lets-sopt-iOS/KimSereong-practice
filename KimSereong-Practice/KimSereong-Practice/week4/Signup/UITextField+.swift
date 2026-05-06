//
//  UITextField+.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/2/26.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}

