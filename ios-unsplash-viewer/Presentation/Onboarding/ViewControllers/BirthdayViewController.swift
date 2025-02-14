//
//  BirthdayViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/23/25.
//

import UIKit
import SnapKit

final class BirthdayViewController: UIViewController {

    //MARK: - UI Property
    let datePicker = UIDatePicker()
    
    //MARK: - Property
    var passData: PassDataDelegate?
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        passData?.birthdayReceived(datePicker.date)
    }
    
    //MARK: - Method
    @objc
    private func okButtonTapped() {
        passData?.birthdayReceived(datePicker.date)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure Method
    private func configureView() {
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
