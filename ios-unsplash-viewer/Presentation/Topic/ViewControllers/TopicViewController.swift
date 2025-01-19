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
    static var selectedPhoto: Photo? {
        didSet {
            // https://gist.github.com/salvar-labs/f574927b77d466e332261ac1647e19a4
            let vc = ImageDetailViewController()
            vc.photo = selectedPhoto
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true)
        }
    }
    private let topics = [Topic.goldenHour, Topic.businessWork, Topic.architectureInterior]
    
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in [0] {
//        for i in topics.indices {
            NetworkManager.shared.unsplashTopicsPhotos(topics[i], 1, 10) { data in
                self.mainView.topicBannerViews[i].configureData(self.topics[i].ko, photo: data)
            }
        }
    }
    
}
