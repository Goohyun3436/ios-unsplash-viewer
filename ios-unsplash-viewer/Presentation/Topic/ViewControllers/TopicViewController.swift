//
//  TopicViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

class TopicViewController: UIViewController {
    
    private lazy var mainView = TopicView(data)
    
    private lazy var data: [[String]] = []
    
    override func loadView() {
        print(#function)
        
        data = [["1"], ["2"], ["3"]]
        
        view = mainView
    }
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        
        //        NetworkManager.shared.unsplashTopicsPhotos("golden-hour", 1, 1)
        //        NetworkManager.shared.unsplashTopicsPhotos("business-work", 1, 1)
        //        NetworkManager.shared.unsplashTopicsPhotos("architecture-interior", 1, 1)
    }
    
}
