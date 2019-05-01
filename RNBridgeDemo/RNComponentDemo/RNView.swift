//
//  RNDemoView.swift
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

import Foundation
import UIKit

@objc(RNView) class RNView: UIView {
    
    @objc var txt: String = "嘿嘿"
    
    @objc(someAction) var someAction: (([String: Any])->Void)? {
        didSet { someAction?([:]) }
    }
    
    private var label: UILabel!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
    
    private func setup() {
        layer.masksToBounds = true
        print("我起來囉, frame=\(frame)")
        label = UILabel()
        label.text = txt
        label.textColor = UIColor.blue
        label.frame = bounds
        addSubview(label)
    }
    
    func setConfig(_ config: String!) {
        print("我開始囉\(config)")
    }
}
