//
//  SearchSortButton.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

class SearchSortButton: BaseButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.separator.cgColor
        backgroundColor = UIColor.systemBackground
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        contentHorizontalAlignment = .leading
        setImage(UIImage(systemName: "arrow.up.and.down.text.horizontal"), for: .normal)
        setTitle("", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    func configureData(_ orderBy: OrderBy) {
        setTitle(" \(orderBy.ko)", for: .normal)
    }
    
}
