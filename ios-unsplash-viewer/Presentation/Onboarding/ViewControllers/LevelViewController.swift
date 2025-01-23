//
//  LevelViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

class LevelViewController: UIViewController {

    //MARK: - Property
    let segmentedControl = UISegmentedControl(items: ["상", "중", "하"])
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - Method
    @objc
    func okButtonTapped() {
        print(#function)
    }
    
    //MARK: - Configure Method
    func configureView() {
        navigationItem.title = "레벨"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(okButtonTapped))
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.centerX.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        segmentedControl.selectedSegmentIndex = 0
    }

}
