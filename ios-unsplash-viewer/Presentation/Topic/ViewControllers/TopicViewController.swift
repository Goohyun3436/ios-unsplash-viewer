//
//  TopicViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

class TopicViewController: UIViewController {
    
    //MARK: - UI Property
    private lazy var mainView = TopicView()
    
    //MARK: - Property
    static var selectedImageId: String? {
        didSet {
            // https://gist.github.com/salvar-labs/f574927b77d466e332261ac1647e19a4
            let vc = TopicDetailViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true)
        }
    }
    private lazy var topics = [[TopicsPhotos]]()
    
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.unsplashTopicsPhotos("golden-hour", 1, 10) { data in
            self.mainView.topicBannerViews[0].configureData("골든 아워", topic: data)
        }
        
        NetworkManager.shared.unsplashTopicsPhotos("business-work", 1, 10) { data in
            self.mainView.topicBannerViews[1].configureData("비지니스 및 업무", topic: data)
        }
        
        NetworkManager.shared.unsplashTopicsPhotos("architecture-interior", 1, 10) { data in
            self.mainView.topicBannerViews[2].configureData("건축 및 인테리어", topic: data)
        }
    }
    
}
