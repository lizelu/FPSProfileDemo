//
//  XViewModel.m
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "XViewModel.h"

@implementation XViewModel
- (void)requestData:(RequestFinish)finish {
    if (finish) {
        [[NetworkRequest shareInstance] requestWithFinish:^(NSArray *requestData) {
            finish(requestData);
        }];
    }
}
@end
