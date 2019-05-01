//
//  public extension + Dictionary.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/29.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation


public extension Dictionary {
    
    public var jsonString: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
}
