//
//  UIView+Frame.m
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/29.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
@end
