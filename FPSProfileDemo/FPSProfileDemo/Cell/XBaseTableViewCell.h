//
//  XBaseTableViewCell.h
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBaseTableViewCell : UITableViewCell

/**
 添加相应的子控件
 */
-(void)setupSubviews;

/**
 控件布局
 */
-(void)addLayoutSubViews;

/**
 更新控件约束
 */
-(void)updateLayoutSubViews;
@end
