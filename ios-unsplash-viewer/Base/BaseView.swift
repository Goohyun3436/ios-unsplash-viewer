//
//  BaseView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

class BaseView: UIView {
    // 프로토콜 활용?
    // 다른 UIImageView 커스텀 클래스를 만들지 않고 UIView 에 ImageView를 addSubView 해서, BaseView 하나만 유지..?
    // (좀더 고민해보기)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
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
