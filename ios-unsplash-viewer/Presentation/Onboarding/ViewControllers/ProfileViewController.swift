//
//  ProfileViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

protocol PassDataDelegate {
    func nicknameReceived(_ name: String?)
}

class ProfileViewController: UIViewController {

    //MARK: - UI Property
    let nicknameButton = UIButton()
    let birthdayButton = UIButton()
    let levelButton = UIButton()
    
    let nicknameLabel = UILabel()
    let birthdayLabel = UILabel()
    let levelLabel = UILabel()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        nicknameButton.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        birthdayButton.addTarget(self, action: #selector(birthdayButtonTapped), for: .touchUpInside)
        levelButton.addTarget(self, action: #selector(levelButtonTapped), for: .touchUpInside)
    }

    //MARK: - Method
    @objc
    func quitButtonTapped() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }
        
        window.rootViewController = OnboardingViewController()
    }
    
    @objc
    func nicknameButtonTapped() {
        let vc = NicknameViewController()
        vc.passData = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func birthdayButtonTapped() {
        navigationController?.pushViewController(BirthdayViewController(), animated: true)
    }
    
    @objc
    func levelButtonTapped() {
        navigationController?.pushViewController(LevelViewController(), animated: true)
    }
    
    //MARK: - Configure Method
    func configureView() {
        navigationItem.title = "프로필 화면"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "탈퇴하기", style: .plain, target: self, action: #selector(quitButtonTapped))
        view.backgroundColor = .white
        
        view.addSubview(nicknameButton)
        view.addSubview(birthdayButton)
        view.addSubview(levelButton)
        
        view.addSubview(nicknameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(levelLabel)
        
        nicknameButton.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        birthdayButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.top.equalTo(nicknameButton.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }

        levelButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.top.equalTo(birthdayButton.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.equalTo(nicknameButton.snp.trailing).offset(24)
            make.height.equalTo(50)
        }
        
        birthdayLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.equalTo(birthdayButton.snp.trailing).offset(24)
            make.height.equalTo(50)
        }

        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.equalTo(levelButton.snp.trailing).offset(24)
            make.height.equalTo(50)
        }

        
        
        nicknameButton.setTitleColor(.black, for: .normal)
        birthdayButton.setTitleColor(.black, for: .normal)
        levelButton.setTitleColor(.black, for: .normal)
        
        nicknameButton.setTitle("닉네임", for: .normal)
        birthdayButton.setTitle("생일", for: .normal)
        levelButton.setTitle("레벨", for: .normal)

        nicknameLabel.text = "NO NAME"
        nicknameLabel.textColor = .lightGray
        nicknameLabel.textAlignment = .right
        
        birthdayLabel.text = "NO DATE"
        birthdayLabel.textColor = .lightGray
        birthdayLabel.textAlignment = .right
        
        levelLabel.text = "NO LEVEL"
        levelLabel.textColor = .lightGray
        levelLabel.textAlignment = .right
    }

}

extension ProfileViewController: PassDataDelegate {
    
    func nicknameReceived(_ name: String?) {
        nicknameLabel.text = name
    }
    
}
