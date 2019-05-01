//
//  public extension + UIButton.swift
//  comic
//
//  Created by Chiao-Te Ni on 2018/1/5.
//  Copyright © 2018年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    public func addBorder(side: UIButtonBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
            case .Top:
                border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
            case .Bottom:
                border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
            case .Left:
                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            case .Right:
                border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }
    
    public enum UIButtonBorderSide {
        case Top
        case Bottom
        case Left
        case Right
    }
    
    public func adjustImageAndTitleOffsetsForButton(spacing: CGFloat) {
        guard let imageSize = imageView?.image?.size else { return }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0,
                                            left: -imageSize.width,
                                            bottom: -(imageSize.height + spacing),
                                            right: 0.0)
        
        let labelString = NSString(string: self.titleLabel!.text!)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing),
                                            left: 0.0,
                                            bottom: 0.0,
                                            right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}
