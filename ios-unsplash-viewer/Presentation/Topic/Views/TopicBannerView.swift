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
    private let topicLabel = UILabel()
    private let imageScrollView = UIScrollView()
    private let imageWrapView = UIStackView()
    private let imageView = UIImageView()
    private let imageView2 = UIImageView()
    private let imageView3 = UIImageView()
    
    var data: [String] = []
    
    init(_ test: [String]) {
        data = test
        print(#function, test)
        
        super.init(frame: .zero)
    }
    
    //MARK: - Configure Method
    override func configureHierarchy() {
        addArrangedSubview(topicLabel)
        addArrangedSubview(imageScrollView)
        imageScrollView.addSubview(imageWrapView)
        imageWrapView.addArrangedSubview(imageView)
        imageWrapView.addArrangedSubview(imageView2)
        imageWrapView.addArrangedSubview(imageView3)
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
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(180)
        }
        
        
        imageView2.snp.makeConstraints { make in
            make.width.equalTo(180)
        }
        imageView3.snp.makeConstraints { make in
            make.width.equalTo(180)
        }
    }
    
    override func configureView() {
        topicLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        imageWrapView.isLayoutMarginsRelativeArrangement = true
        
        topicLabel.backgroundColor = .yellow
        imageScrollView.backgroundColor = .green
        imageWrapView.backgroundColor = .blue
        imageView.backgroundColor = .purple
        imageView2.backgroundColor = .purple
        imageView3.backgroundColor = .purple
        topicLabel.text = data[0]
    }
    
}
