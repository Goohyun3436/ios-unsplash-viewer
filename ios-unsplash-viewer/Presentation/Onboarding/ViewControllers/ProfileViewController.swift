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
    func birthdayReceived(_ date: Date)
    func levelReceived(_ level: Int?)
}

final class ProfileViewController: UIViewController {

    //MARK: - UI Property
    private let nicknameButton = UIButton()
    private let birthdayButton = UIButton()
    private let levelButton = UIButton()
    
    private let nicknameLabel = UILabel()
    private let birthdayLabel = UILabel()
    private let levelLabel = UILabel()
    
    private let saveButton = UIButton()
    
    //MARK: - Property
    private var nickname: String? {
        didSet {
            if let nickname {
                nicknameLabel.text = nickname
            } else {
                nicknameLabel.text = "NO NAME"
            }
            
            checkSaveButtonActive()
        }
    }
    private var birthday: Date? {
        didSet {
            if let birthday {
                birthdayLabel.text = birthday.formatted(date: .numeric, time: .omitted)
            } else {
                birthdayLabel.text = "NO DATE"
            }
            
            checkSaveButtonActive()
        }
    }
    private var level: Int? {
        didSet {
            if let level {
                levelLabel.text = ["상", "중", "하"][level]
            } else {
                levelLabel.text = "NO LEVEL"
            }
            
            checkSaveButtonActive()
        }
    }
    
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        nickname = UserDefaults.standard.string(forKey: "nickname")
        birthday = UserDefaults.standard.object(forKey: "birthday") as? Date
        if let level = UserDefaults.standard.string(forKey: "level") {
            self.level = Int(level)
        } else {
            self.level = nil
        }
        
        nicknameButton.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        birthdayButton.addTarget(self, action: #selector(birthdayButtonTapped), for: .touchUpInside)
        levelButton.addTarget(self, action: #selector(levelButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    //MARK: - Method
    @objc
    private func quitButtonTapped() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }
        
        window.rootViewController = OnboardingViewController()
        
        UserDefaults.standard.removeObject(forKey: "nickname")
        UserDefaults.standard.removeObject(forKey: "birthday")
        UserDefaults.standard.removeObject(forKey: "level")
        UserDefaults.standard.set(true, forKey: "isOnboarding")
        UserDefaults.standard.set(false, forKey: "isOnboardingStart")
    }
    
    @objc
    private func nicknameButtonTapped() {
        let vc = NicknameViewController()
        vc.passData = self
        vc.textField.text = nickname
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func birthdayButtonTapped() {
        let vc = BirthdayViewController()
        vc.passData = self
        if let birthday {
            vc.datePicker.date = birthday
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func levelButtonTapped() {
        let vc = LevelViewController()
        vc.passData = self
        vc.segmentedControl.selectedSegmentIndex = level ?? 0
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func saveButtonTapped() {
        DispatchQueue.global().async {
            UserDefaults.standard.set(self.nickname, forKey: "nickname")
            UserDefaults.standard.set(self.birthday, forKey: "birthday")
            UserDefaults.standard.set(self.level, forKey: "level")
            UserDefaults.standard.set(false, forKey: "isOnboarding")
        }
        configureRootVC(TabBarController())
    }
    
    private func checkSaveButtonActive() {
        if let nickname, let birthday, let level {
            saveButton.setTitleColor(UIColor.white, for: .normal)
            saveButton.backgroundColor = UIColor.black
        } else {
            saveButton.setTitleColor(UIColor.gray, for: .normal)
            saveButton.backgroundColor = UIColor.clear
        }
    }
    
    //MARK: - Configure Method
    private func configureView() {
        navigationItem.title = "프로필 화면"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "탈퇴하기", style: .plain, target: self, action: #selector(quitButtonTapped))
        view.backgroundColor = .white
        
        view.addSubview(nicknameButton)
        view.addSubview(birthdayButton)
        view.addSubview(levelButton)
        
        view.addSubview(nicknameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(levelLabel)
        
        view.addSubview(saveButton)
        
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
        
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        nicknameButton.setTitleColor(.black, for: .normal)
        birthdayButton.setTitleColor(.black, for: .normal)
        levelButton.setTitleColor(.black, for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        
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
        
        saveButton.setTitle("저장하기", for: .normal)
        saveButton.layer.cornerRadius = 8
        saveButton.backgroundColor = UIColor.black
    }

}

extension ProfileViewController: PassDataDelegate {
    
    func nicknameReceived(_ name: String?) {
        nickname = name
    }
    
    func birthdayReceived(_ date: Date) {
        birthday = date
    }
    
    func levelReceived(_ level: Int?) {
        self.level = level
    }
    
}
