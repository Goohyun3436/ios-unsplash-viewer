//
//  LevelViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

final class LevelViewController: UIViewController {

    //MARK: - UI Property
    let segmentedControl = UISegmentedControl(items: ["상", "중", "하"])
    
    //MARK: - Property
    var passData: PassDataDelegate?
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        passData?.levelReceived(segmentedControl.selectedSegmentIndex)
    }
    
    //MARK: - Method
    @objc
    private func okButtonTapped() {
        passData?.levelReceived(segmentedControl.selectedSegmentIndex)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure Method
    private func configureView() {
        navigationItem.title = "레벨"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(okButtonTapped))
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.centerX.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }

}
