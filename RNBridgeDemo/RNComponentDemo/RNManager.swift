//
//  RNManager.swift
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

import UIKit
import React

@objc(RNManager) class RNManager: NSObject {
    
    // MARK: - JS call swift, 輸入參數
    @objc func sendMsg(_ msg: String, number: Int) -> Void {
        print("sendMsg測試：\(msg), \(number)")
    }
    // MARK: - JS call swift, 輸入dic
    @objc(sendDic:msg:) func sendDic(_ dic: [String: Any], msg: String) -> Void {
        print("sendMsg測試：\(dic), \(msg)")
    }
    
    // MARK: - JS call swift, 輸入參數 ＋ callBack
    @objc(sendParam:withCallBack:) func sendParamWithCallBack(_ param: String, callBack: @escaping RCTResponseSenderBlock) {
        DispatchQueue.main.async {
            callBack([param])
        }
    }
}
