//
//  AppAppearance.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import UIKit

final class AppAppearance {
    static func setUpAppearance() {
        let appearanceT = UITabBarAppearance()
        appearanceT.configureWithTransparentBackground()
        appearanceT.backgroundColor = UIColor.systemBackground
        UITabBar.appearance().tintColor = UIColor.label
        UITabBar.appearance().standardAppearance = appearanceT
        UITabBar.appearance().scrollEdgeAppearance = appearanceT
        
        let appearanceN = UINavigationBarAppearance()
        appearanceN.configureWithTransparentBackground()
        appearanceN.backgroundColor = UIColor.systemBackground
        appearanceN.titleTextAttributes = [.foregroundColor: UIColor.label, .font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        appearanceN.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        UINavigationBar.appearance().standardAppearance = appearanceN
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceN
        
        BaseView.appearance().backgroundColor = UIColor.systemBackground
        UIStackView.appearance().backgroundColor = UIColor.systemBackground
        UILabel.appearance().textColor = UIColor.label
        UIButton.appearance().setTitleColor(UIColor.label, for: .normal)
        UIButton.appearance().tintColor = UIColor.label
    }
}
