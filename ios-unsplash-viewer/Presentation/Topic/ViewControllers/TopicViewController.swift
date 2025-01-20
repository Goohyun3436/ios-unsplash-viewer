//
//  TopicViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

class TopicViewController: UIViewController {
    
    //MARK: - UI Property
    private lazy var mainView = TopicView(refreshHandler: {
        self.fetchRandomTopics()
    })
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRandomTopics()
    }
    
    //MARK: - Method
    @discardableResult
    func fetchRandomTopics() -> DispatchGroup {
        let randomTopics = Topic.allCases.shuffled().prefix(3)
        
        let group = DispatchGroup()
        
        for i in randomTopics.indices {
            group.enter()
            
            NetworkManager.shared.unsplashTopicsPhotos(randomTopics[i], 1, 10) { data in
                self.mainView.topicBannerViews[i].configureData(randomTopics[i].ko, photo: data)
                
                group.leave()
            }
        }
        
        return group
    }
    
}
