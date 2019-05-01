//
//  public extension + String + NSAttributedString.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension NSAttributedString {
    
    //輸入寬度計算高度
    public func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.height
    }
    
    //輸入高度計算寬度
    public func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.width
    }
}

public extension String {
    
    public func versionToInt() -> Int {
        var arr = self.split{$0 == "."}.map(String.init)
        arr = arr.reversed()
        var output = 0
        
        for index in 0..<(arr.count) {
            let val = Int(arr[index]) ?? 0
            let test = pow( 100.0, index)
            let result = NSDecimalNumber(decimal: test)
            output = output + val * Int(truncating: result)
        }
        return output
    }
    
    public func getSize(with font:UIFont) -> CGSize{
        let textSize = NSString(string: self).size(withAttributes: [ NSAttributedString.Key.font:font ])
        return textSize
    }
    
    //将原始的url编码为合法的url
    public func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    public func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    public func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
