
//
//  RNVideoView.m
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTView.h>

@interface RCT_EXTERN_MODULE(RNVideoView, UIView)

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
