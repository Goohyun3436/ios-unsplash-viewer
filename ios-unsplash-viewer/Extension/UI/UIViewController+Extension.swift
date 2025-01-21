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
        // https://gist.github.com/salvar-labs/f574927b77d466e332261ac1647e19a4
        let vc = ImageDetailViewController()
        vc.photo = selectedPhoto
        
        // navigationController가 nil 인 이유? -> self 가 tabBarController -> TBC의 VCs에 접근할 수 있는 방법?
//        navigationController?.pushViewController(vc, animated: true)
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        present(nav, animated: true)
    }
    
    func presentUnsplashAlert(_ status: ResponseStatusUnsplash) {
        let alert = UIAlertController(title: status.statusCode, message: status.ko, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
