//
//  UIViewController+Extension.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

extension UIViewController {
    func addBackButton(color: UIColor = .label) {
        let btn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        btn.tintColor = color
        navigationItem.leftBarButtonItem = btn
    }
    
    @objc
    func backButtonTapped() {
        dismiss(animated: true)
    }
}
