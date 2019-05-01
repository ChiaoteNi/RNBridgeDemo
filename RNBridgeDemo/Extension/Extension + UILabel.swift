//
//  public extension + UILabel.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel{
    
    //設定常用小說列表中出現的框框
    public func setBorderForNavelStyle() {
        self.textAlignment = NSTextAlignment.center
        self.layer.borderWidth = 1
        self.layer.borderColor = self.textColor.cgColor
        self.layer.cornerRadius = 3.0
        self.adjustsFontSizeToFitWidth = true
    }
    
    //依據字型調整寬度
    public func autoReSizeOfWidth(widthConstraint: NSLayoutConstraint, extraWidth: CGFloat = 15) {
        self.frame.size = self.intrinsicContentSize
        widthConstraint.constant = self.intrinsicContentSize.width + extraWidth
        self.layoutIfNeeded()
    }
    
    public func setLikeToast() {
        self.textAlignment = NSTextAlignment.center
        self.layer.borderWidth = 1
        self.layer.borderColor = self.backgroundColor?.cgColor
        self.layer.cornerRadius = 15.0
        self.adjustsFontSizeToFitWidth = true
    }
    
    public func getSize(with font: UIFont) -> CGSize{
        let textSize = NSString(string: self.text ?? "").size(withAttributes: [ NSAttributedString.Key.font:font ])
        return textSize
    }
    
    public func setSizeFont (sizeFont: CGFloat) {
        guard let font = UIFont(name: self.font.fontName, size: sizeFont) else { return }
        self.font = font
        self.sizeToFit()
    }
    
    public func resizeToFitSmallPhone() {
        var size = self.text?.size(withAttributes: [.font: self.font]) ?? .zero
        size = CGSize(width: size.width - 2, height: size.height - 2)
        let textSize = size.height
        self.font = self.font.withSize(textSize)
    }
    
    public func setLineSpacing(lineSpacing: CGFloat = 0) {
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString: NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value:paragraphStyle,
                                      range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}
