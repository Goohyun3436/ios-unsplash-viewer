//
//  BirthdayViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

class BirthdayViewController: UIViewController {

    //MARK: - UI Property
    let datePicker = UIDatePicker()
    
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
        navigationItem.title = "생일"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(okButtonTapped))
        view.backgroundColor = .white
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.centerX.top.equalTo(view.safeAreaLayoutGuide)
        }
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }

}
