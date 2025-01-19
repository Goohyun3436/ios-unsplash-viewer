//
//  UIImageView+Extension.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

extension UIImageView {
    func configureCircle() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}
