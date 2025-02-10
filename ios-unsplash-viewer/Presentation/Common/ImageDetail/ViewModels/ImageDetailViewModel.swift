//
//  ImageDetailViewModel.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 2/10/25.
//

import Foundation

final class ImageDetailViewModel: BaseViewModel {
    
    private(set) var input: Input
    private(set) var output: Output
    
    struct Input {
        let photo: Observable<Photo?> = Observable(nil)
    }
    
    struct Output {
        let photo: Observable<Photo?> = Observable(nil)
        let statistics: Observable<PhotosStatistics?> = Observable(nil)
        let status: Observable<ResponseStatusUnsplash> = Observable(.ok)
    }
    
    init() {
        input = Input()
        output = Output()
        
        input.photo.lazyBind { [weak self] photo in
            self?.output.photo.value = photo
            self?.getPhotoStatistics(of: photo)
        }
    }
    
    private func getPhotoStatistics(of photo: Photo?) {
        guard let photo else { return }
        
        NetworkManager.shared.unsplashGet(.photosStatistics(photo.id), PhotosStatistics.self) { [weak self] data in
            self?.output.statistics.value = data
        } failHandler: { [weak self] status in
            self?.output.status.value = status
        }
    }
    
}
