//
//  InfoRowView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit

class InfoRowView: BaseStackView {
    
    //MARK: - UI Property
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    //MARK: - Initialize Method
    init(_ title: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
    }
    
    //MARK: - Configure Method
    override func configureHierarchy() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
    }
    
    override func configureLayout() {
        axis = .horizontal
        distribution = .equalSpacing
    }
    
    override func configureView() {
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        
        valueLabel.text = "texttexttexttexttext"
    }
    
}
