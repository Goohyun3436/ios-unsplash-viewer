//
//  SearchColorFilterView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit
import SnapKit

class SearchColorFilterView: BaseScrollView {
    
    //MARK: - UI Property
    private let contentView = UIStackView()
    let colorButton = [
        UIButton(),
        UIButton(),
        UIButton(),
        UIButton(),
        UIButton(),
        UIButton(),
        UIButton()
    ]
    
    private let colors = ColorFilter.allCases
    
    override func configureHierarchy() {
        addSubview(contentView)
        
        for i in colors.indices {
            colorButton[i].tag = i
            colorButton[i].setTitle(" \(colors[i].ko)", for: .normal)
            colorButton[i].tintColor = colors[i].color
            contentView.addArrangedSubview(colorButton[i])
        }
    }
    
    override func configureLayout() {
        keyboardDismissMode = .onDrag
        showsHorizontalScrollIndicator = false
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        contentView.axis = .horizontal
        contentView.spacing = 8
        
        for item in colorButton {
            item.snp.makeConstraints { make in
                make.height.equalTo(30)
            }
        }
    }
    
    override func configureView() {
        for item in colorButton {
            item.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            item.layer.cornerRadius = 16
            item.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
            item.backgroundColor = UIColor.systemGray6
            item.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            item.setTitleColor(UIColor.label, for: .normal)
        }
    }
    
}
