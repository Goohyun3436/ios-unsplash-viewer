//
//  TopicViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

class TopicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        NetworkManager.shared.unsplashTopicsPhotos("golden-hour", 1, 1)
        NetworkManager.shared.unsplashTopicsPhotos("business-work", 1, 1)
        NetworkManager.shared.unsplashTopicsPhotos("architecture-interior", 1, 1)
    }
    
}
