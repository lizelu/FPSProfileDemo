//
//  NetworkRequest.m
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest
+ (NetworkRequest *)shareInstance {
    static NetworkRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)requestWithFinish:(RequestFinish)finish {
    if (finish != nil) {
        finish([self createRandomData]);
    }
}

- (NSArray *)createRandomData {
    NSMutableArray *randomData = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        int random = arc4random();
        MyCustomModel *model = [[MyCustomModel alloc] init];
        model.headerImageName = [NSString stringWithFormat:@"%d.jpg", random%10];
        model.title = [NSString stringWithFormat:@"我是大标题标题%d", i];
        model.firstText = random / 2 == 0 ? @"" : @"详情详情详情详情详情1";
        model.secondText = random / 3 == 0 ? @"" : @"详情详情详情详情详详情情2";
        model.thirdText = random / 4 == 0 ? @"" : @"详情详情详情详情3";
        model.forthText = random / 5 == 0 ? @"" : @"详情详情详情详情4";
        model.fifthText = random / 6 == 0 ? @"" : @"详情详情详情详情详情详情5";
        model.sixthText = random / 7 == 0 ? @"" : @"详情详情详情详情6";
        model.seventhText = random / 8 == 0 ? @"" : @"详情详情详情详情详情详情详情详情详情7";
        [randomData addObject:model];
    }
    return randomData;
}

@end
