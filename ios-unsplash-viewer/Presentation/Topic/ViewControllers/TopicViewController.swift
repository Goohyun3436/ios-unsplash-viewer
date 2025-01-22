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
        var responseStatus: ResponseStatusUnsplash?
        let randomTopics = Array(Topic.allCases.shuffled().prefix(3))
        var photos = [[Photo]?]()
        
        // 데이터 받아오는 동안 탭바 버튼 눌림, 메인 스레드 + 동기적으로 실행해야 하는지?
        
        let group = DispatchGroup()
        
        for i in randomTopics.indices {
            group.enter()
            
            NetworkManager.shared.unsplashGet(.topicsPhotos(randomTopics[i], 1, 10), [Photo].self) { data in
                photos.append(data)
                group.leave()
            } failHandler: { status in
                responseStatus = status
                photos.append(nil)
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            if let responseStatus {
                self.presentUnsplashAlert(responseStatus)
            }
            
            self.mainView.configureData(randomTopics, photos)
            self.mainView.endRefreshing()
        }
    }
    
}
