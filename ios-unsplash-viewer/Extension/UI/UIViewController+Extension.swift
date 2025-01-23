//
//  UIViewController+Extension.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import UIKit

extension UIViewController {
    func addBackButton(color: UIColor = .label) {
        let btn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        btn.tintColor = color
        navigationItem.leftBarButtonItem = btn
    }
    
    @objc
    func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func presentImageDetailView(_ selectedPhoto: Photo) {
        let vc = ImageDetailViewController()
        vc.photo = selectedPhoto
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        present(nav, animated: true)
    }
    
    func presentUnsplashAlert(_ status: ResponseStatusUnsplash) {
        let alert = UIAlertController(title: "실패", message: "\(status.ko) (\(status.statusCode))", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func configureRootVC(_ vc: UIViewController) {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }
        
        window.rootViewController = vc
    }
}
