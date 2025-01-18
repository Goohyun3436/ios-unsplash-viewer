//
//  InfoView.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import SnapKit

class InfoView: BaseView {
    
    //MARK: - UI Property
    private let titleLabel = UILabel()
    private let textWrapView = UIStackView()
    
    private let sizeWrapView = UIStackView()
    private let sizeTitleLabel = UILabel()
    private let sizeLabel = UILabel()
    
    private let viewsWrapView = UIStackView()
    private let viewsTitleLabel = UILabel()
    private let viewsLabel = UILabel()
    
    private let downloadsWrapView = UIStackView()
    private let downloadsTitleLabel = UILabel()
    private let downloadsLabel = UILabel()
    
    //MARK: - Configure Method
    override func configureHierarchy() {
        addSubview(titleLabel)
        addSubview(textWrapView)
        textWrapView.addArrangedSubview(sizeWrapView)
        sizeWrapView.addArrangedSubview(sizeTitleLabel)
        sizeWrapView.addArrangedSubview(sizeLabel)
        textWrapView.addArrangedSubview(viewsWrapView)
        viewsWrapView.addArrangedSubview(viewsTitleLabel)
        viewsWrapView.addArrangedSubview(viewsLabel)
        textWrapView.addArrangedSubview(downloadsWrapView)
        downloadsWrapView.addArrangedSubview(downloadsTitleLabel)
        downloadsWrapView.addArrangedSubview(downloadsLabel)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        textWrapView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        textWrapView.axis = .vertical
        textWrapView.spacing = 8
        
        sizeWrapView.axis = .horizontal
        sizeWrapView.distribution = .equalSpacing
        viewsWrapView.axis = .horizontal
        viewsWrapView.distribution = .equalSpacing
        downloadsWrapView.axis = .horizontal
        downloadsWrapView.distribution = .equalSpacing
    }
    
    override func configureView() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        sizeTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        sizeLabel.font = UIFont.systemFont(ofSize: 14)
        viewsTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        viewsLabel.font = UIFont.systemFont(ofSize: 14)
        downloadsTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        downloadsLabel.font = UIFont.systemFont(ofSize: 14)
        
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
