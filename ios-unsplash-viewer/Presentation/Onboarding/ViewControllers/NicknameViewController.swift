//
//  NicknameViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

final class NicknameViewController: UIViewController {
    
    //MARK: - UI Property
    let textField = UITextField()
    
    //MARK: - Property
    var passData: PassDataDelegate?
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        okButtonTapped()
    }
    
    //MARK: - Method
    @objc
    private func okButtonTapped() {
        passData?.nicknameReceived(textField.text)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure Method
    private func configureView() {
        textField.delegate = self
        
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

//MARK: - UITextField
extension NicknameViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        okButtonTapped()
        return true
    }
    
}
