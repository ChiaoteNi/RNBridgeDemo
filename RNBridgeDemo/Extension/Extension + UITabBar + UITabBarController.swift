//
//  public extension + UITabBar + UITabBarController.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UITabBarController {
    
    public func setTabBarVisible(visible: Bool, duration: TimeInterval, animated: Bool) {
        if (tabBarIsVisible() == visible) { return }
        let frame = self.tabBar.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        let animationAction = {
            self.tabBar.frame.offsetBy(dx: 0, dy: offsetY)
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + offsetY)
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }
        
        // animation
        if #available(iOS 10.0, *) {
            UIViewPropertyAnimator(duration: duration, curve: .linear) { animationAction() }.startAnimation()
        } else {
            UIView.animate(withDuration: duration, animations: { animationAction() })
        }
    }
    
    public func tabBarIsVisible() -> Bool {
        return self.tabBar.frame.origin.y < UIScreen.main.bounds.height
    }
    
    public func resetTabBarItemTitles(with titles: [String]) {
        guard let tabBaritemsCount = tabBar.items?.count, tabBaritemsCount >= titles.count else {
            print("resetTabBarItemTitles, but tabBaritemsCount < titles.count")
            return
        }
        for i in 0 ..< titles.count {
            guard let item = tabBar.items?[i] else {
                print("resetTabBarItem, but items not exist.")
                return
            }
            item.title = titles[i]
        }
    }
}
