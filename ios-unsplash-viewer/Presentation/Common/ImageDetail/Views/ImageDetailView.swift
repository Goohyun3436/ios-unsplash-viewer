//
//  ImageDetailView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import Kingfisher
import SnapKit

final class ImageDetailView: BaseView {
    
    //MARK: - UI Property
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    private let userView = UserView()
    private let imageView = UIImageView()
    private let infoView = InfoView()
    
    //MARK: - Configure Method
    func configureData(_ photo: Photo?) {
        guard let photo else { return }
        
        userView.configureData(photo.user, photo.created_at_format)
        
        let url = URL(string: photo.urls.regular)
        imageView.kf.setImage(with: url)
        resizeImageView(photo.width, photo.height)
        infoView.configureData(photo.width, photo.height)
    }
    
    func configureData(_ statistics: PhotosStatistics?) {
        guard let statistics else { return }
        
        infoView.configureData(statistics)
    }
    
    private func resizeImageView(_ width: Int, _ height: Int) {
        let ratio: CGFloat = CGFloat(width) / CGFloat(height)
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width).multipliedBy(1 / ratio)
        }
    }
    
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
    
}
