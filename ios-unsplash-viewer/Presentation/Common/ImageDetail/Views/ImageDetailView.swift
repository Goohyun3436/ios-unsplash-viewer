//
//  ImageDetailView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import SnapKit

class ImageDetailView: BaseView {
    
    //MARK: - UI Property
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    private let userView = UserView()
    private let imageView = UIImageView()
    private let infoView = InfoView()
    
    //MARK: - Configure Method
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addArrangedSubview(userView)
        contentView.addArrangedSubview(imageView)
        contentView.addArrangedSubview(infoView)
    }
    
    override func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide)
            make.verticalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.verticalEdges.equalTo(scrollView).inset(16)
        }
        contentView.axis = .vertical
        contentView.spacing = 16
        
        userView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width).multipliedBy(1)
        }
        
        infoView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
        }
    }
    
    override func configureView() {
        userView.backgroundColor = .red
        imageView.backgroundColor = .red
        infoView.backgroundColor = .red
    }
    
}
