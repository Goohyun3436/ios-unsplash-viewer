//
//  BannerImageView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import Kingfisher
import SnapKit

class BannerImageView: BaseImageView {
    
    //MARK: - UI Property
    private let starWrapView = UIStackView()
    private let starImageView = UIImageView()
    private let startLabel = UILabel()
    
    //MARK: - Property
    private var imageId: String?
    
    //MARK: - initialize Method
    override init() {
        super.init()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        isUserInteractionEnabled = true
        addGestureRecognizer(singleTap)
    }
    
    @objc
    func imageTapped() {
        guard let imageId else { return }
        
        TopicViewController.selectedImageId = imageId
    }
    
    //MARK: - Configure Method
    func configureData(_ topic: TopicsPhotos) {
        imageId = topic.id
        let url = URL(string: topic.urls.regular)
        kf.setImage(with: url)
        startLabel.text = "\(topic.likes.formatted())"
    }
    
    override func configureHierarchy() {
        addSubview(starWrapView)
        starWrapView.addArrangedSubview(starImageView)
        starWrapView.addArrangedSubview(startLabel)
    }
    
    override func configureLayout() {
        starWrapView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        starWrapView.axis = .horizontal
        starWrapView.spacing = 8
        starWrapView.layoutMargins = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        starWrapView.isLayoutMarginsRelativeArrangement = true
        
        starImageView.snp.makeConstraints { make in
            make.size.equalTo(12)
        }
    }
    
    override func configureView() {
        starWrapView.layer.cornerRadius = 12
        starWrapView.backgroundColor = .black
        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = UIColor.systemYellow
        startLabel.font = UIFont.systemFont(ofSize: 12)
        startLabel.textColor = UIColor.systemGray
    }
}
