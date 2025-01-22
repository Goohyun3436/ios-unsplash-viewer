//
//  TapBarController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

private enum TabBar: CaseIterable {
    case topic
    case video
    case search
    case user
    
    var vc: UIViewController.Type {
        switch self {
        case .topic:
            return TopicViewController.self
        case .video:
            return DummyViewController.self
        case .search:
            return SearchViewController.self
        case .user:
            return DummyViewController.self
        }
    }
    
    var title: String {
        switch self {
        case .topic:
            return "OUR TOPIC"
        case .video:
            return "VIDEO"
        case .search:
            return "SEARCH PHOTO"
        case .user:
            return "MY"
        }
    }
    
    var icon: String {
        switch self {
        case .topic:
            return "chart.xyaxis.line"
        case .video:
            return "play.rectangle"
        case .search:
            return "magnifyingglass"
        case .user:
            return "heart"
        }
    }
}

final class TapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTBC()
    }
    
    private func configureTBC() {
        let tabs = TabBar.allCases
        var navs = [UINavigationController]()
        
        for item in tabs {
            navs.append(makeNav(item.vc.init(), item.title, item.icon))
        }
        
        setViewControllers(navs, animated: true)
    }
    
    private func makeNav(_ viewController: UIViewController, _ title: String, _ icon: String) -> UINavigationController {
        let vc = viewController
        let nav = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = title
        nav.tabBarItem.image = UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 16, weight: .bold)))?.withBaselineOffset(fromBottom: UIFont.systemFontSize)
        return nav
    }
    
}
