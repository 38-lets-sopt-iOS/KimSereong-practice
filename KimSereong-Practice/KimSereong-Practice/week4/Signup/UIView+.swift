//
//  UIView+.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 5/2/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
