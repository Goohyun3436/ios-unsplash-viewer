//
//  TapBarController.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

class TapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTBC()
    }
    
    private func configureTBC() {
        let topicNav = makeNav(TopicViewController(), title: "OUR TOPIC", icon: "chart.xyaxis.line")
        let searchNav = makeNav(SearchViewController(), title: "SEARCH PHOTO", icon: "magnifyingglass")
        
        setViewControllers([topicNav, searchNav], animated: true)
    }
    
    private func makeNav(_ viewController: UIViewController, title: String, icon: String) -> UINavigationController {
        let vc = viewController
        let nav = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = title
        nav.tabBarItem.image = UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 16, weight: .bold)))?.withBaselineOffset(fromBottom: UIFont.systemFontSize)
        return nav
    }
    
}
