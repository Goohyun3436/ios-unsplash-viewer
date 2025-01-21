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
    func fetchRandomTopics() {
        let randomTopics = Topic.allCases.shuffled().prefix(3)
        
        // 데이터 받아오는 동안 탭바 버튼 눌림, 메인 스레드 + 동기적으로 실행해야 하는지?
        for i in [0] {
//        for i in randomTopics.indices {
            NetworkManager.shared.unsplashGet(.topicsPhotos(randomTopics[i], 1, 10), [Photo].self) { data in
                self.mainView.topicBannerViews[i].configureData(randomTopics[i].ko, photo: data)
                
                if i == randomTopics.count - 1 {
                    self.mainView.endRefreshing()
                }
            } failHandler: { status in
                self.presentUnsplashAlert(status)
            }
        }
    }
    
}
