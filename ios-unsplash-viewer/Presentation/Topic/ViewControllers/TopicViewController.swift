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
    private let topics = Topic.allCases
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomTopics = topics.shuffled().prefix(3)
        
        for i in randomTopics.indices {
            NetworkManager.shared.unsplashTopicsPhotos(randomTopics[i], 1, 10) { data in
                self.mainView.topicBannerViews[i].configureData(randomTopics[i].ko, photo: data)
            }
        }
    }
    
}
