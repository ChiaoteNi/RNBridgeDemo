//
//  public extension + Data.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation

public extension Data {
    //Htmlstring 轉 可以放在label上的字串
    //Usage: LABEL.attributedText = STRING!.data(using: String.Encoding.utf8)?.getAttributedString()
    public func getAttributedString() -> NSAttributedString? {
        do {
            return try NSAttributedString(data: self,
                                          options:[.documentType: NSAttributedString.DocumentType.html,
                                                   .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch let error as NSError {
            print("public extension Data , getAttributedString(), error: " + error.localizedDescription)
        }
        return nil
    }
    
    /// decode Data to Model
    ///
    /// - Parameter type: type of model, whtch comfirm Codable
    /// - Returns: instance of model
    public func decodeToModel <T: Codable> (type: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(type, from: self)
        } catch {
            print("Parse Json Error: " + error.localizedDescription)
            let string : String = NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String? ?? "失敗"
            print("JSON content is:" + string)
        }
        return nil
    }
    
    public func json2String() -> String {
        let finalStr = String(data: self, encoding: String.Encoding.utf8)
        return finalStr ?? ""
    }
    
    public func json2Array() -> [String: Any]?{
        do {
            guard let arr =  try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [String: Any] else { return nil }
            return arr
            
        } catch {
            let errorInfo = "\(#function), error: " + String(error.localizedDescription)
            print(errorInfo)
            return nil
        }
    }
}
