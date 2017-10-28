//
//  XBaseTableViewCell.h
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomModel.h"

@interface XBaseTableViewCell : UITableViewCell

/**
 设置Cell的值

 @param model 相对应的Model
 */
-(void)setCellInfo:(MyCustomModel *)model;

/**
 添加相应的子控件
 */
-(void)setupSubviews;

/**
 控件布局，子类实现
 */
-(void)addLayoutSubViews;

/**
 更新控件约束，子类实现
 */
-(void)updateLayoutSubViews;
@end
