//
//  TopicViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import Kingfisher

class TopicViewController: UIViewController {
    
    //MARK: - UI Property
    private lazy var mainView = TopicView()
    
    //MARK: - Property
    private lazy var topics = [[TopicsPhotos]]()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.unsplashTopicsPhotos("golden-hour", 1, 2) { data in
            
            let topicBannerView = self.mainView.topicBannerView
            topicBannerView.topicLabel.text = "골든 아워"
            let url = URL(string: data[0].urls.regular)
            topicBannerView.imageView.kf.setImage(with: url)
            print("test")
            
        }
        
//        view.backgroundColor = UIColor.gray
        
        //        NetworkManager.shared.unsplashTopicsPhotos("golden-hour", 1, 1)
        //        NetworkManager.shared.unsplashTopicsPhotos("business-work", 1, 1)
        //        NetworkManager.shared.unsplashTopicsPhotos("architecture-interior", 1, 1)
    }
    
}
