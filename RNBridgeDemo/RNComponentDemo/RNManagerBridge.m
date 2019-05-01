//
//  RNManagerBridge.m
//  RNBridgeDemo
//
//  Created by admin on 2018/10/23.
//  Copyright © 2018年 paradise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNManager, NSObject)
RCT_EXTERN_METHOD(sendMsg:(NSString *)msg number:(NSNumber *)number)
RCT_EXTERN_METHOD(sendDic:(NSDictionary *)dic msg:(NSString *)msg)
RCT_EXTERN_METHOD(sendParam:(NSString *)param withCallBack:(RCTResponseSenderBlock)callBack)

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
//
