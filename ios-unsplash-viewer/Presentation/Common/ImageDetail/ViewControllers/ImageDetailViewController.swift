//
//  ImageDetailViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit

final class ImageDetailViewController: BaseViewController {
    
    //MARK: - UI Property
    private let mainView = ImageDetailView()
    
    //MARK: - Property
    private let viewModel = ImageDetailViewModel()
    
    init(photo: Photo) {
        super.init(nibName: nil, bundle: nil)
        viewModel.input.photo.value = photo
    }
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Setup Method
    override func setupActions() {
        addBackButton()
    }
    
    override func setupBinds() {
        viewModel.output.photo.lazyBind { [weak self] photo in
            self?.mainView.configureData(photo)
        }
        
        viewModel.output.statistics.lazyBind { [weak self] statistics in
            self?.mainView.configureData(statistics)
        }
        
        viewModel.output.status.lazyBind { [weak self] status in
            self?.presentUnsplashAlert(status)
        }
    }
}
