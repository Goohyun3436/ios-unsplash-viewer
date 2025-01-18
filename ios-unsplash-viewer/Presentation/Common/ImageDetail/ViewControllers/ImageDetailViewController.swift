//
//  ImageDetailViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import SnapKit

class ImageDetailViewController: UIViewController {
    
    //MARK: - UI Property
    let mainView = ImageDetailView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
//        NetworkManager.shared.unsplashPhotosStatistics("8i4bU_CIRrc") { data in
//            dump(data)
//        }
    }
}
