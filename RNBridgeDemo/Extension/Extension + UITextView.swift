//
//  public extension + UITextView.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/18.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UITextView {
    
    public func numberOfLines(lineSpacing: CGFloat = 0) -> Int {
        self.sizeToFit()
        
        let font = self.font
        let lineHeight = (font?.lineHeight ?? 1) + lineSpacing
        let textHeight = self.textContainer.size.height
        let numberOfLines = Int(textHeight / lineHeight)
        
        return numberOfLines
    }
    
    public func removeBlankNewLine() {
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        text.append(contentsOf: "\n")
    }
    
    public func removePadding() {
        let inset = -self.textContainer.lineFragmentPadding
        self.contentInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
