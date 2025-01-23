//
//  NicknameViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController {
    
    //MARK: - UI Property
    let textField = UITextField()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - Method
    @objc func okButtonTapped() {
        print(#function)
    }
    
    //MARK: - Configure Method
    func configureView() {
        navigationItem.title = "닉네임"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(okButtonTapped))
        view.backgroundColor = .white
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerX.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        textField.placeholder = "닉네임을 입력해주세요"
    }
    
}
