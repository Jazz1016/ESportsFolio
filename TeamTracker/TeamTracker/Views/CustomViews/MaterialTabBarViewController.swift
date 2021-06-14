//
//  MaterialTabBarViewController.swift
//  TeamTracker
//
//  Created by James Lea on 6/2/21.
//

import UIKit
import MaterialComponents.MaterialTabs_TabBarView
import MaterialComponents.MaterialTabs_TabBarViewTheming
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

protocol tabBarSwitched: AnyObject {
    func showTourneys()
    func showMatches()
}

class MaterialTabBarViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static weak var delegate: tabBarSwitched?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tab1 = UITabBarItem(title: "Matches", image: UIImage(named: ""), tag: 0)
        let tab2 = UITabBarItem(title: "Tournaments", image: UIImage(named: ""), tag: 0)
        
        let tabBarView = MDCTabBarView(frame: CGRect(x: (view.frame.size.width-400)/2, y: 0, width: 400, height: 70))
        tabBarView.items = [
            tab1,
            tab2
        ]
        let containerScheme = MDCContainerScheme()
        
        tabBarView.applyPrimaryTheme(withScheme: containerScheme)
        tabBarView.barTintColor = Colors.customDarkGray
        tabBarView.bottomDividerColor = Colors.lightTextColor ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tabBarView.preferredLayoutStyle = .fixed
        view.addSubview(tabBarView)
        tabBarView.tabBarDelegate = self
        
    }
}

extension MaterialTabBarViewController: MDCTabBarViewDelegate {
    func tabBarView(_ tabBarView: MDCTabBarView, shouldSelect item: UITabBarItem) -> Bool {
        return (tabBarView.items.firstIndex(of: item) != nil)
    }
    
    func tabBarView(_ tabBarView: MDCTabBarView, didSelect item: UITabBarItem) {
        if item.title! == "Tournaments"{
            MaterialTabBarViewController.delegate?.showTourneys()
            
        } else {
            MaterialTabBarViewController.delegate?.showMatches()
            
        }
    }
}

