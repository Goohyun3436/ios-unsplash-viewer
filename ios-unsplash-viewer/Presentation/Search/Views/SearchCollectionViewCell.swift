//
//  SearchCollectionViewCell.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: - UI Property
    private let mainView = ImageCardView(corner: true)
    
    //MARK: - Property
    static let identifier = "SearchCollectionViewCell"
    
    //MARK: - Configure Method
    func configureData(_ photo: Photo) {
        mainView.configureData(photo)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(mainView)
    }
    
    override func configureLayout() {
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    override func configureView() {
        backgroundColor = .orange
    }
    
}
