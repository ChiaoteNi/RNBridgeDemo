//
//  public extension + UISearchBar.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/27.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit
//import UISearchBar_AlignPlacehoderLeft

public extension UISearchBar {
    
    public func setButtonTitle(with text: String) {
        guard let btn = self.value(forKey: "cancelButton") as? UIButton else {
            print("setButtonTitle, but cancelButton get fail")
            return
        }
        btn.setTitle(text, for: .normal)
    }
    
    public func setPlaceholderAlignLeft() {
        guard #available(iOS 11, *) else {
//            self.setAlignPlaceholerLeft(true)
            return
        }
    }
    
    public func hideIconImg() {
        self.setImage(UIImage(), for: .search, state: .normal)
        self.searchTextPositionAdjustment = UIOffset(horizontal: -19, vertical: 0);
    }
}
