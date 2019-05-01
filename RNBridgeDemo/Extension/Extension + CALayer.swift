//
//  public extension + CALayer.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension CALayer {
    
    //加入指定上下左右的 Border
    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat, forceLength: CGFloat = 0.0) {
        let border = CALayer()
        
        switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: (forceLength > 0) ? (self.frame.size.width - forceLength)/2.0 : 0, y: 0, width: (forceLength > 0) ? forceLength : self.frame.size.width, height: thickness)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect(x: (forceLength > 0) ? (self.frame.size.width - forceLength)/2.0 :  0, y: self.frame.size.height - thickness, width: (forceLength > 0) ? forceLength : self.frame.size.width, height: thickness)
                break
            case UIRectEdge.left:
                border.frame = CGRect(x: 0, y: (forceLength > 0) ? (self.frame.height - forceLength)/2.0 : 0, width: thickness, height: (forceLength > 0) ? forceLength : self.frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect(x: self.frame.size.width - thickness, y: (forceLength > 0) ? (self.frame.height - forceLength)/2.0 : 0, width: thickness, height: (forceLength > 0) ? forceLength : self.frame.size.height)
                break
            default:
                break
        }
        
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
    public func setGradientBGColor(colors: [CGColor], locations: [NSNumber], direction: Direction = .vertical) {
        let headerGradient = CAGradientLayer()
        headerGradient.frame = self.bounds
        headerGradient.colors = colors
        headerGradient.locations = locations
        if direction == .vertical {
            headerGradient.startPoint = CGPoint(x: 1, y: 0)
            headerGradient.endPoint   = CGPoint(x: 1, y: 1)
        } else {
            headerGradient.startPoint = CGPoint(x: 0, y: 1)
            headerGradient.endPoint   = CGPoint(x: 1, y: 1)
        }
        
        self.insertSublayer(headerGradient, at: 0)
    }
    
    public enum Direction {
        case vertical
        case horizental
    }
}
