//
//  TopicBannerView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import SnapKit

class TopicBannerView: BaseStackView {
    
    //MARK: - UI Property
    let topicLabel = UILabel()
    private let imageScrollView = UIScrollView()
    private let imageWrapView = UIStackView()
    private let imageViews = [
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true),
        ImageCardView(corner: true)
    ]
    
    //MARK: - Configure Method
    func configureData(_ topicId: String, photo: [Photo]) {
        topicLabel.text = topicId
        
        for i in photo.indices {
            imageViews[i].configureData(photo[i])
        }
    }
    
    override func configureHierarchy() {
        addArrangedSubview(topicLabel)
        addArrangedSubview(imageScrollView)
        imageScrollView.addSubview(imageWrapView)
        
        for item in imageViews {
            imageWrapView.addArrangedSubview(item)
        }
    }
    
    override func configureLayout() {
        axis = .vertical
        
        topicLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.height.equalTo(34)
        }
        
        let imageW: CGFloat = 180
        let imageH: CGFloat = 250
        
        imageScrollView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(imageH)
        }
        imageScrollView.showsHorizontalScrollIndicator = false
        
        imageWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(imageScrollView)
            make.height.equalTo(imageScrollView.snp.height)
        }
        imageWrapView.axis = .horizontal
        imageWrapView.spacing = 8
        imageWrapView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        imageWrapView.isLayoutMarginsRelativeArrangement = true
        
        for item in imageViews {
            item.snp.makeConstraints { make in
                make.width.equalTo(imageW)
            }
        }
    }
    
    override func configureView() {
        topicLabel.font = UIFont.systemFont(ofSize: 16, weight: .black)
        topicLabel.textColor = UIColor.label
    }
    
}
