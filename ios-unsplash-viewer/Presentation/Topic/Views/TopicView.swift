//
//  TopicScrollView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import SnapKit

final class TopicView: BaseView {
    
    //MARK: - UI Property
    private lazy var scrollView = {
        let view = UIScrollView()
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        return view
    }()
    private let contentView = UIStackView()
    private let topicBannerViews = [
        TopicBannerView(),
        TopicBannerView(),
        TopicBannerView()
    ]
    
    //MARK: - Property
    private let timer = DispatchTimeInterval.seconds(30)
    private var isValid: Bool = true
    private var refresh: (() -> Void)?
    
    //MARK: - Initializer Method
    init(refreshHandler: @escaping () -> Void) {
        super.init(frame: .zero)
        
        refresh = refreshHandler
    }
   
    //MARK: - Method
    @objc
    private func refreshHandler() {
        guard let refresh else {
            return
        }
        
        scrollToFirst()
        
        guard isValid else {
            DispatchQueue.main.async {
                self.scrollView.refreshControl?.endRefreshing()
            }
            return
        }
        
        refresh()
    }
    
    func endRefreshing() {
        guard let isRefreshing = self.scrollView.refreshControl?.isRefreshing else {
            return
        }
        
        guard isRefreshing else {
            return
        }
        
        DispatchQueue.main.async {
            self.scrollView.refreshControl?.endRefreshing()
        }
        
        isValid = false
        
        DispatchQueue.global().asyncAfter(deadline: .now() + timer) {
            self.isValid = true
        }
    }
    
    private func scrollToFirst() {
        for item in topicBannerViews {
            item.imageScrollView.setContentOffset(.zero, animated: true)
        }
    }
    
    //MARK: - Configure Method
    func configureData(_ topics: [Topic], _ photos: [[Photo]?]) {
        for i in topicBannerViews.indices {
            topicBannerViews[i].configureData(topics[i].ko, photo: photos[i])
        }
    }
    
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        for item in topicBannerViews {
            contentView.addArrangedSubview(item)
        }
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
    }
    
}
