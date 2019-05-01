//
//  public extension + UIApplication.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    public var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
    
    public var topNavigationController: UINavigationController? {
        return topViewController as? UINavigationController
    }
    
    public func isFirstLaunch() -> Bool {
        if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBefore") {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }
    
    public func getStatusBarSize() -> CGSize? {
        guard let statusBarWindow = self.value(forKey: "statusBarWindow") as? UIWindow else {
            print("getStatusBarSize, but get statusBarWindow fail")
            return nil
        }
        guard let statusBar = statusBarWindow.value(forKey: "statusBar") as? UIView else {
            print("getStatusBarSize, but get statusBar fail")
            return nil
        }
        let size = statusBar.bounds.size
        return size
    }
}
