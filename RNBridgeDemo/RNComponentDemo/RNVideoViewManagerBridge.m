//
//  RNVideoViewManager.m
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(RNVideoViewManager, RCTViewManager)
+ (BOOL)requiresMainQueueSetup {
    return YES;
}
@end
