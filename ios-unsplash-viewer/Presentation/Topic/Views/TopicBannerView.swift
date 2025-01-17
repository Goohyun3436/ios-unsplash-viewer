//
//  TopicBannerView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import Kingfisher
import SnapKit

class TopicBannerView: BaseStackView {
    
    //MARK: - UI Property
    let topicLabel = UILabel()
    private let imageScrollView = UIScrollView()
    private let imageWrapView = UIStackView()
    let imageViews = [
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
    ]
    
    //MARK: - Configure Method
    func configureData(_ topicname: String, topic: [TopicsPhotos]) {
        topicLabel.text = topicname
        for i in topic.indices {
            let url = URL(string: topic[i].urls.regular)
            imageViews[i].kf.setImage(with: url)
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
        
        imageScrollView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(260)
        }
        
        imageWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(imageScrollView)
            make.height.equalTo(imageScrollView.snp.height)
        }
        imageWrapView.axis = .horizontal
        imageWrapView.spacing = 8
        imageWrapView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        for item in imageViews {
            item.snp.makeConstraints { make in
                make.width.equalTo(180)
            }
        }
    }
    
    override func configureView() {
        topicLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        imageWrapView.isLayoutMarginsRelativeArrangement = true
        
        topicLabel.backgroundColor = .yellow
        imageScrollView.backgroundColor = .green
        imageWrapView.backgroundColor = .blue
        
        for item in imageViews {
            item.backgroundColor = .purple
        }
        
        topicLabel.text = "test"
    }
    
}
