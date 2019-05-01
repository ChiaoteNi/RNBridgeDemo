//
//  public extension + UIScrollView.swift
//  comic
//
//  Created by Chiao-Te Ni on 2018/1/5.
//  Copyright © 2018年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    public func removeContentInset() {
        let inset = self.contentInset
        self.contentInset = UIEdgeInsets(top: -inset.top, left: -inset.left, bottom: -inset.bottom, right: -inset.right)
        self.layoutIfNeeded()
    }
}
