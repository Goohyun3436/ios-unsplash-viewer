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
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: {
        let layout = UICollectionViewFlowLayout()
        
        let inset: CGFloat = 0
        let spacing: CGFloat = 3
        let cellPerRow: CGFloat = 2
        let width: CGFloat = (UIScreen.main.bounds.width - inset * 2 - spacing * (cellPerRow - 1)) / cellPerRow
        let height: CGFloat = width * 1.5
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        return layout
    }())
    
    //MARK: - Property
    var query: String? {
        didSet {
            if let query {
                NetworkManager.shared.unsplashSearchPhotos(query, 1, 20, orderBy: OrderBy.latest) { data in
                    self.total = data.total
                    self.totalPages = data.total_pages
                    self.photos = data.results
                    
                    print(self.total, self.totalPages, self.photos)
                }
            }
        }
    }
    var total: Int = 0
    var totalPages: Int = 0
    var photos = [Photo]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        
        configureSearchBar()
        configureCollectionView()
        
        query = "robot"
        
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
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
    
    func configureH() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }
    
    func configureL() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureV() {
        
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
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        
        cell.configureData(photos[indexPath.item])
        
        return cell
    }
    
}
