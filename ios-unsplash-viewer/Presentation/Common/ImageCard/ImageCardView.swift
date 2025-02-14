//
//  BannerImageView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import Kingfisher
import SnapKit

final class ImageCardView: BaseImageView {
    
    //MARK: - UI Property
    private let starWrapView = UIStackView()
    private let starImageView = UIImageView()
    private let startLabel = UILabel()
    
    //MARK: - Property
    private var photo: Photo?
    
    //MARK: - initialize Method
    init(radius cornerRadius: CGFloat = 12) {
        super.init()
        
        self.layer.cornerRadius = cornerRadius
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        isUserInteractionEnabled = true
        addGestureRecognizer(singleTap)
    }
    
    @objc
    private func imageTapped() {
        guard let photo else { return }
        
        UIApplication.shared.keyWindow?.rootViewController?.presentImageDetailView(photo)
    }
    
    //MARK: - Configure Method
    func configureData(_ photo: Photo) {
        self.photo = photo
        let url = URL(string: photo.urls.regular)
        kf.setImage(with: url)
        startLabel.text = "\(photo.likes.formatted())"
    }
    
    override func configureHierarchy() {
        addSubview(starWrapView)
        starWrapView.addArrangedSubview(starImageView)
        starWrapView.addArrangedSubview(startLabel)
    }
    
    override func configureLayout() {
        starWrapView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().inset(12)
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
        clipsToBounds = true
        contentMode = .scaleAspectFill
        backgroundColor = UIColor.lightGray
        starWrapView.layer.cornerRadius = 12
        starWrapView.backgroundColor = UIColor.darkGray
        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = UIColor.systemYellow
        startLabel.font = UIFont.systemFont(ofSize: 12)
        startLabel.textColor = UIColor.white
    }
}
