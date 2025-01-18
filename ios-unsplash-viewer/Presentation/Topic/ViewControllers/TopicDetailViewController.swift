//
//  TopicDetailViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit

class TopicDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        NetworkManager.shared.unsplashPhotosStatistics("8i4bU_CIRrc") { data in
            dump(data)
        }
    }
    
}
