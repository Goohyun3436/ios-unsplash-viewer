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
    lazy var scrollView = {
        let view = UIScrollView()
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        return view
    }()
    private let contentView = UIStackView()
    let topicBannerViews = [
        TopicBannerView(),
        TopicBannerView(),
        TopicBannerView()
    ]
    
    //MARK: - Property
    var refresh: (() -> Void)?
    
    //MARK: - Initializer Method
    init(refreshHandler: @escaping () -> Void) {
        super.init(frame: .zero)
        
        refresh = refreshHandler
    }
   
    //MARK: - Method
    @objc
    func refreshHandler() {
        guard let refresh else {
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
    }
    
    //MARK: - Configure Method
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
    
    override func configureView() {
        backgroundColor = UIColor.systemBackground
        contentView.backgroundColor = UIColor.systemBackground
    }
    
}
