//
//  public extension + Date.swift
//  ck101
//
//  Created by Chiao-Te Ni on 2018/7/26.
//  Copyright © 2018年 Webber. All rights reserved.
//

import Foundation

public extension Date {
    //取得 timestep 取到毫秒
    public var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970) * 1_000)
    }
    
    public func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
