//
//  UserView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import Kingfisher
import SnapKit

class UserView: BaseView {
    
    //MARK: - UI Property
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    
    //MARK: - Configure Method
    func configureData(_ user: User, _ createdAt: String) {
        let url = URL(string: user.profile_image.small)
        profileImageView.kf.setImage(with: url)
        nameLabel.text = user.name
        dateLabel.text = createdAt
    }
    
    override func configureHierarchy() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(dateLabel)
    }
    
    override func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview()
            make.size.equalTo(34)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalTo(profileImageView.snp.top)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.bottom.equalTo(profileImageView.snp.bottom)
        }
    }
    
    override func configureView() {
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        
        profileImageView.backgroundColor = .black
        nameLabel.text = "nameLabel"
        dateLabel.text = "dateLabel"
    }
    
}
