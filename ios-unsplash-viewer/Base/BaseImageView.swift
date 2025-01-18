//
//  BaseImageView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit

class BaseImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {}
    
    func configureLayout() {}
    
    func configureView() {}
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
