//
//  PhotoSearchBar.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

class PhotoSearchBar: BaseSearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchBarStyle = .minimal
        placeholder = "키워드 검색"
        setValue("취소", forKey: "cancelButtonText")
        tintColor = UIColor.label
    }
    
}
