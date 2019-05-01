//
//  public extension + Bundle.swift
//  comic
//
//  Created by Chiao-Te Ni on 2018/1/4.
//  Copyright © 2018年 Appimc. All rights reserved.
//

import Foundation

public extension Bundle {
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

