//
//  TopicScrollView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import SnapKit

class TopicView: BaseView {
    
    //MARK: - UI Property
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    
    private let topicBannerView = TopicBannerView()
    private let topicBannerView2 = TopicBannerView()
    private let topicBannerView3 = TopicBannerView()
   
    //MARK: - Configure Method
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addArrangedSubview(topicBannerView)
        contentView.addArrangedSubview(topicBannerView2)
        contentView.addArrangedSubview(topicBannerView3)
    }
    
    override func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide)
            make.verticalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.verticalEdges.equalTo(scrollView)
        }
        contentView.axis = .vertical
        contentView.spacing = 16
    }
    
    override func configureView() {
        backgroundColor = .red
        contentView.backgroundColor = .orange
    }
    
}
