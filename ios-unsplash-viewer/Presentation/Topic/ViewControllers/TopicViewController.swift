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
    
    //MARK: - Property
    var responseStatus: ResponseStatusUnsplash?
    var photos = [[Photo]?]()
    
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
        let randomTopics = Array(Topic.allCases.shuffled().prefix(3))
        
        // 데이터 받아오는 동안 탭바 버튼 눌림, 메인 스레드 + 동기적으로 실행해야 하는지?
        
        let group = DispatchGroup()
        
        for i in randomTopics.indices {
            group.enter()
            
            NetworkManager.shared.unsplashGet(.topicsPhotos(randomTopics[i], 1, 10), [Photo].self) { data in
                self.photos.append(data)
                group.leave()
            } failHandler: { status in
                self.responseStatus = status
                self.photos.append(nil)
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            if let status = self.responseStatus {
                self.presentUnsplashAlert(status)
            }
            
            self.mainView.configureData(randomTopics, self.photos)
            
            self.mainView.endRefreshing()
            self.photos = []
        }
    }
    
}
