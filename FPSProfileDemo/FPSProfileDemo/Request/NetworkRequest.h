//
//  NetworkRequest.h
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCustomModel.h"

typedef void (^RequestFinish)(NSArray *requestData);

@interface NetworkRequest : NSObject

/**
 网络请求单例
 */
+ (NetworkRequest *)shareInstance;

/**
 模拟网络请求

 @param finish 回调请求参数
 */
- (void)requestWithFinish:(RequestFinish)finish;
@end
