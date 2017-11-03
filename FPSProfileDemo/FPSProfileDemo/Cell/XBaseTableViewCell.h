//
//  XBaseTableViewCell.h
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomModel.h"
#import "Masonry.h"

@interface XBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *firstLineDetailLabel;
@property (nonatomic, strong) UILabel *secondLineDetailLabel;
@property (nonatomic, strong) UILabel *thirdLineDetailLabel;
@property (nonatomic, strong) UILabel *forthLineDetailLabel;
@property (nonatomic, strong) UILabel *fifthLineDetailLabel;
@property (nonatomic, strong) UILabel *sixthLineDetailLabel;
@property (nonatomic, strong) UILabel *seventhLineDetailLabel;
@property (nonatomic, strong) UILabel *eighthLineDetailLabel;
@property (nonatomic, strong) UILabel *ninthLineDetailLabel;
@property (nonatomic, strong) UILabel *tenthLineDetailLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) MyCustomModel *model;

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

/**
 随机生成属性字符串

 @param text 原字符串
 @return 属性字符串
 */
-(NSMutableAttributedString *)createAttributeString:(NSString *)text;
@end
