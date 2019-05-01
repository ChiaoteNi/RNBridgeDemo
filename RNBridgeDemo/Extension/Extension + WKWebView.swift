//
//  public extension + WKWebView.swift
//  comic
//
//  Created by Chiao-Te Ni on 2018/2/2.
//  Copyright © 2018年 Appimc. All rights reserved.
//

import Foundation
import WebKit

public extension WKWebView {
    
    public func removeCookies(of target: String = ""){
        //iOS9.0以上使用的方法
        guard #available(iOS 9.0, *) else {
            print("removeCookied fail, ios < 9")
            return
        }
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: { (records) in
            for record in records{
                //清除本站的cookie
                guard record.displayName.contains(target) else { continue }//这个判断注释掉的话是清理所有的cookie
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
                    //清除成功
                    print("cookies remove success, \(record)")
                })
            }
        })
    }
}
