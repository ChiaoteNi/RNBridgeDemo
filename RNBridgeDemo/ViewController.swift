//
//  ViewController.swift
//  RNBridgeDemo
//
//  Created by admin on 2018/10/22.
//  Copyright © 2018年 paradise. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {
    
    var rnView: RCTRootView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlStr = "http://localhost:8081/index.bundle?platform=ios"
//        let urlStr = "http://chiaoni3145951.com/ApiTest/bundles/rnDemo_flatList.jsbundle"
        guard let url = URL.init(string: urlStr) else { return }
        guard let rnView = RCTRootView(bundleURL: url, moduleName: "rnDemo", initialProperties: nil, launchOptions: nil) else { return }
        view.addSubview(rnView)
        self.rnView = rnView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rnView?.frame = view.bounds
    }
    
    override func didMove(toParent parent: UIViewController?) {
        guard parent == nil else { return }
        rnView?.removeFromSuperview()
        rnView?.bridge.invalidate()
        rnView = nil
    }
}

