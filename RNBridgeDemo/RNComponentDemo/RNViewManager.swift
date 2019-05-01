//
//  RNDemoViewManager.swift
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

import Foundation
import React

@objc(RNViewManager) class RNViewManager: RCTViewManager {
    
    override func view() -> UIView! {
        return RNView()
    }
}
