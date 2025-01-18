//
//  ImageDetailView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import SnapKit

class ImageDetailView: BaseView {
    
    //MARK: - UI Property
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    
    private let userView = UserView()
    
    private let imageView = UIImageView()
    
    private let infoWrapView = UIView()
    private let titleLabel = UILabel()
    private let textWrapView = UIStackView()
    private let labelWrapView1 = UIStackView()
    private let sizeTitleLabel = UILabel()
    private let sizeLabel = UILabel()
    private let labelWrapView2 = UIStackView()
    private let viewsTitleLabel = UILabel()
    private let viewsLabel = UILabel()
    private let labelWrapView3 = UIStackView()
    private let downloadsTitleLabel = UILabel()
    private let downloadsLabel = UILabel()
    
    //MARK: - Configure Method
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addArrangedSubview(userView)
        
        contentView.addArrangedSubview(imageView)
        
        contentView.addArrangedSubview(infoWrapView)
        infoWrapView.addSubview(titleLabel)
        infoWrapView.addSubview(textWrapView)
        textWrapView.addArrangedSubview(labelWrapView1)
        labelWrapView1.addArrangedSubview(sizeTitleLabel)
        labelWrapView1.addArrangedSubview(sizeLabel)
        textWrapView.addArrangedSubview(labelWrapView2)
        labelWrapView2.addArrangedSubview(viewsTitleLabel)
        labelWrapView2.addArrangedSubview(viewsLabel)
        textWrapView.addArrangedSubview(labelWrapView3)
        labelWrapView3.addArrangedSubview(downloadsTitleLabel)
        labelWrapView3.addArrangedSubview(downloadsLabel)
    }
    
    override func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide)
            make.verticalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.verticalEdges.equalTo(scrollView).inset(16)
        }
        contentView.axis = .vertical
        contentView.spacing = 16
        
        userView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
        }
        
        
        
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width).multipliedBy(1)
        }
        
        
        infoWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(infoWrapView).offset(16)
            make.top.equalTo(infoWrapView)
            make.width.equalTo(infoWrapView).multipliedBy(0.3)
        }
        
        textWrapView.snp.makeConstraints { make in
            make.trailing.equalTo(infoWrapView).inset(16)
            make.verticalEdges.equalTo(infoWrapView)
            make.width.equalTo(infoWrapView).multipliedBy(0.7)
        }
        textWrapView.axis = .vertical
        textWrapView.spacing = 8
        
        labelWrapView1.axis = .horizontal
        labelWrapView1.distribution = .equalSpacing
        labelWrapView2.axis = .horizontal
        labelWrapView2.distribution = .equalSpacing
        labelWrapView3.axis = .horizontal
        labelWrapView3.distribution = .equalSpacing
    }
    
    override func configureView() {
       
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        sizeTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        sizeLabel.font = UIFont.systemFont(ofSize: 14)
        viewsTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        viewsLabel.font = UIFont.systemFont(ofSize: 14)
        downloadsTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        downloadsLabel.font = UIFont.systemFont(ofSize: 14)
        
        userView.backgroundColor = .red
        
        imageView.backgroundColor = .red
        infoWrapView.backgroundColor = .red
        titleLabel.text = "test"
        titleLabel.backgroundColor = .yellow
        textWrapView.backgroundColor = .green
        sizeTitleLabel.text = "title"
        sizeLabel.text = "texttexttexttexttext"
        viewsTitleLabel.text = "title"
        viewsLabel.text = "texttexttexttexttext"
        downloadsTitleLabel.text = "title"
        downloadsLabel.text = "texttexttexttexttext"
    }
    
}
