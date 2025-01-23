//
//  OnboardingViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    //MARK: - UI Property
    let button = UIButton()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveOnboarding(true)

        view.backgroundColor = .darkGray
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(50)
        }
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        button.setTitle("시작하기", for: .normal)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    deinit {
        saveOnboarding(false)
    }
    
    //MARK: - Method
    func saveOnboarding(_ isOnboarding: Bool) {
        UserDefaults.standard.set(isOnboarding, forKey: "isOnboarding")
    }
    
    @objc
    func buttonTapped() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }
        
        let vc = ProfileViewController()
        window.rootViewController = UINavigationController(rootViewController: vc)
    }
    
}
