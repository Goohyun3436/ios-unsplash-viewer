//
//  ImageDetailViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    //MARK: - UI Property
    private let mainView = ImageDetailView()
    
    //MARK: - Property
    var photo: Photo? {
        didSet {
            if let photo {
                NetworkManager.shared.unsplashPhotosStatistics(photo.id) { data in
                    self.mainView.configureData(photo: photo, statistics: data)
                }
            }
        }
    }
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        addBackButton()
    }
}
