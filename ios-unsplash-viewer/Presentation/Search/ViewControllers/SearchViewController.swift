//
//  SearchViewController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit
import SnapKit

enum SearchStatus {
    case normal, emptyQuery, shortQuery, emptyData
    
    var message: String {
        switch self {
        case .normal:
            return "사진을 검색해보세요."
        case .emptyQuery:
            return "검색어를 입력하세요."
        case .shortQuery:
            return "검색어를 두 글자 이상 입력하세요."
        case .emptyData:
            return "검색 결과가 없습니다."
        }
    }
}

class SearchViewController: UIViewController {

    //MARK: - UI Property
    let searchBar = PhotoSearchBar()
    lazy var collectionView = SearchCollectionView()
    let sortButton = SearchSortButton()
    let statusLabel = UILabel()
    
    //MARK: - Property
    var query: String? {
        didSet {
            guard oldValue != query else {
                return
            }
            
            page = 1
        }
    }
    var page: Int = 0 {
        didSet {
            callRequest(query)
            
            if page == totalPages {
                isEnd = true
            }
        }
    }
    let perPage: Int = 20
    var orderBy = OrderBy.relevant {
        didSet {
            removePhotos()
            page = 1
        }
    }
    var total: Int = 0
    var totalPages: Int = 0
    var photos = [Photo]() {
        didSet {
            collectionView.reloadData()
        }
    }
    var isEnd: Bool = false
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        
        setStatusLabel(SearchStatus.normal)
        
        configureSearchBar()
        configureSortButton()
        configureCollectionView()
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    //MARK: - Method
    func callRequest(_ query: String?) {
        guard let query else { return }
        
        print(#function)
        print(query, page, perPage)
        
        NetworkManager.shared.unsplashSearchPhotos(query, page, perPage, orderBy) { data in
            if self.page == 1 {
                self.total = data.total
                self.totalPages = data.total_pages
                self.photos = data.results
                
                guard self.total != 0 else {
                    self.setStatusLabel(SearchStatus.emptyData)
                    return
                }
                
                self.setStatusLabel(nil)
                self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
            } else {
                self.photos.append(contentsOf: data.results)
            }
            
//            print(self.total, self.totalPages, self.photos)
            
            print("\(self.photos.count)/\(self.total)")
        }
    }
    
    private func setStatusLabel(_ status: SearchStatus?) {
        guard let status else {
            statusLabel.isHidden = true
            return
        }
        
        statusLabel.isHidden = false
        statusLabel.text = status.message
    }
    
    @objc private func sortButtonTapped() {
        orderBy = orderBy.toggle()
        sortButton.configureData(orderBy)
    }
    
    private func removePhotos() {
        photos = []
        total = 0
        totalPages = 0
        isEnd = false
    }
    
    //MARK: - Configure Method
    private func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(sortButton)
        view.addSubview(collectionView)
        view.addSubview(statusLabel)
    }
    
    private func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        sortButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(16)
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.width.equalTo(104)
            make.height.equalTo(32)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureView() {
        statusLabel.font = UIFont.systemFont(ofSize: 18, weight: .black)
        statusLabel.textColor = UIColor.label
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    
    private func configureSortButton() {
        sortButton.configureData(orderBy)
        sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
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
            setStatusLabel(SearchStatus.emptyQuery)
            return
        }
        
        guard query.count >= 2 else {
            setStatusLabel(SearchStatus.shortQuery)
            return
        }
        
        self.query = query
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        removePhotos()
        setStatusLabel(SearchStatus.normal)
        
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
