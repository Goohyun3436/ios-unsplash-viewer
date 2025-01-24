//
//  OnboardingViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    //MARK: - UI Property
    private let button = UIButton()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isOnboardingStart = UserDefaults.standard.bool(forKey: "isOnboardingStart")
        
        if isOnboardingStart {
            buttonTapped()
        }
    }
    
    deinit {
        UserDefaults.standard.set(true, forKey: "isOnboardingStart")
    }
    
    //MARK: - Method
    @objc
    private func buttonTapped() {
        let vc = UINavigationController(rootViewController: ProfileViewController())
        configureRootVC(vc)
    }
    
    private func configureView() {
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
    }
    
}
