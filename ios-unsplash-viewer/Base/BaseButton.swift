//
//  BaseButton.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
