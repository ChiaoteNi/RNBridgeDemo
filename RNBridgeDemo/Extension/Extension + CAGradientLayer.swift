//
//  public extension + CAGradientLayer.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension CAGradientLayer {
    
    public static func setNovelTitleGradientLayer(view: UIView?, index: Int) {
        
        guard let view = view else {
            print("WARNING: setNovelTitleGradientLayer, but target view not exist.")
            return
        }
        let headerGradient = CAGradientLayer()
        headerGradient.frame = view.bounds
        
        switch index {
            case 0:
                headerGradient.colors = [UIColor.init(red: 243/255.0, green: 111/255.0, blue: 135.0/255.0, alpha: 1).cgColor,
                                         UIColor.init(red: 253.0/255.0, green: 173.0/255.0, blue: 45.0/255.0, alpha: 1).cgColor]
            case 1:
                headerGradient.colors = [UIColor.init(red: 40.0/255.0, green: 205.0/255.0, blue: 161.0/255.0, alpha: 1).cgColor,
                                         UIColor.init(red: 83.0/255.0, green: 190.0/255.0, blue: 237.0/255.0, alpha: 1).cgColor]
            case 2:
                headerGradient.colors = [UIColor.init(red: 75.0/255.0, green: 176.0/255.0, blue: 167.0/255.0, alpha: 1).cgColor,
                                         UIColor.init(red: 139.0/255.0, green: 209.0/255.0, blue: 28.0/255.0, alpha: 1).cgColor]
            case 3:
                headerGradient.colors = [UIColor.init(red: 164/255.0, green: 60/255.0, blue: 221/255.0, alpha: 1).cgColor,
                                         UIColor.init(red: 233/255.0, green: 68/255.0, blue: 123/255.0, alpha: 1).cgColor]
            default:
                print("WARNING: setNovelTitleGradientLayer, but index out of range.")
                break
        }
        
        headerGradient.locations = [0.0,0.5]
        headerGradient.startPoint = CGPoint(x: 0, y: 0.5)
        headerGradient.endPoint   = CGPoint(x: 1, y: 0.5)
        view.layer.insertSublayer(headerGradient, at: 0)
    }
}
