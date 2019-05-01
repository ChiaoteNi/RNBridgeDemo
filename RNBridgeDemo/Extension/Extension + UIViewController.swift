//
//  public extension + UIViewController.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    public func hasEnterBefore(of vc: UIViewController.Type? = nil) -> Bool {
        let vcName = vc.self?.className ?? self.className
        
        if UserDefaults.standard.bool(forKey: "\(vcName)hasEnterBefore") == false {
            UserDefaults.standard.set(true, forKey: "\(vcName)hasEnterBefore")
            UserDefaults.standard.synchronize()
            return false
        }
        return true
    }
    
    public func setHasEnteredRecord() {
        UserDefaults.standard.set(true, forKey: "\(self.className)hasEnterBefore")
        UserDefaults.standard.synchronize()
    }
}
