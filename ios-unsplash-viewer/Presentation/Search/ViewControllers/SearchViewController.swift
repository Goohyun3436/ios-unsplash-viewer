//
//  SearchViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    //MARK: - UI Property
    let searchBar = UISearchBar()
    
    //MARK: - Property
    var query: String? {
        didSet {
            if let query {
                NetworkManager.shared.unsplashSearchPhotos(query, 1, 1, orderBy: OrderBy.latest)
            }
        }
    }
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        
        configureSearchBar()
        
        configureH()
        configureL()
        configureV()
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "키워드 검색"
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.tintColor = UIColor.label
    }
    
    func configureH() {
        view.addSubview(searchBar)
    }
    
    func configureL() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
    }
    
    func configureV() {}
    
}

//MARK: - UISearchBar
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
        
        guard var query = searchBar.text else {
            return
        }
        
        query = query.trimmingCharacters(in: .whitespaces)
        
        guard !query.isEmpty else {
            // 빈쿼리
            return
        }
        
        guard query.count >= 2 else {
            // 2글자 이상
            return
        }
        
        self.query = query
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
}
