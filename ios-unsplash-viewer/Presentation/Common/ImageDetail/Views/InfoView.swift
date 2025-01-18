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
    private let infoRowViews = [
        InfoRowView("크기"),
        InfoRowView("조회수"),
        InfoRowView("다운로드")
    ]
    
    //MARK: - Configure Method
    func configureData(_ width: Int, _ height: Int, _ statistics: PhotosStatistics) {
        infoRowViews[0].valueLabel.text = "\(width) x \(height)"
        infoRowViews[1].valueLabel.text = "\(statistics.views.total.formatted())"
        infoRowViews[2].valueLabel.text = "\(statistics.downloads.total.formatted())"
    }
    
    override func configureHierarchy() {
        addSubview(titleLabel)
        addSubview(textWrapView)
        
        for item in infoRowViews {
            textWrapView.addArrangedSubview(item)
        }
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
    }
    
    override func configureView() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        titleLabel.text = "정보"
        titleLabel.backgroundColor = .yellow
        textWrapView.backgroundColor = .green
    }
    
}
