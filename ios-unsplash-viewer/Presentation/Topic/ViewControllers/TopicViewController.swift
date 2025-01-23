//
//  TopicViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

final class TopicViewController: UIViewController {
    
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
        
        configureProfileButton()
        fetchRandomTopics()
    }
    
    //MARK: - Method
    private func fetchRandomTopics() {
        var responseStatus: ResponseStatusUnsplash?
        let randomTopics = Array(Topic.allCases.shuffled().prefix(3))
        var photos = [[Photo]?]()
        
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
    
    func configureProfileButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(profileButtonTapped))
    }
    
    @objc
    func profileButtonTapped() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
