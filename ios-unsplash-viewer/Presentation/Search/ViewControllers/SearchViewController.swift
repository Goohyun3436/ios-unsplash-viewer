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
    let searchBar = PhotoSearchBar()
    lazy var collectionView = SearchCollectionView()
    
    //MARK: - Property
    var query: String? {
        didSet {
            callRequest(query)
        }
    }
    var page: Int = 1 {
        didSet {
            callRequest(query)
            
            if page == totalPages {
                isEnd = true
            }
        }
    }
    let perPage: Int = 20
    var total: Int = 0
    var totalPages: Int = 0
    var photos = [Photo]() {
        didSet {
            collectionView.reloadData()
        }
    }
    var isEnd: Bool = false
    
    //MARK: - Method
    func callRequest(_ query: String?) {
        guard let query else { return }
        
        print(#function)
        print(query, page, perPage)
        
        NetworkManager.shared.unsplashSearchPhotos(query, page, perPage, orderBy: OrderBy.relevant) { data in
            if self.page == 1 {
                self.total = data.total
                self.totalPages = data.total_pages
                self.photos = data.results
            } else {
                self.photos.append(contentsOf: data.results)
            }
            
//            print(self.total, self.totalPages, self.photos)
            
            print("\(self.photos.count)/\(self.total)")
        }
    }
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        
        configureSearchBar()
        configureCollectionView()
        
        query = "FF"
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
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
        searchBar.text = ""
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
}

//MARK: - UICollectionView
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        
        cell.configureData(photos[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard !isEnd else {
            return
        }
        
        for item in indexPaths {
            if photos.count - 2 == item.item {
                page += 1
            }
        }
    }
    
}
