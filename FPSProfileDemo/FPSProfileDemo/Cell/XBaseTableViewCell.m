//
//  XBaseTableViewCell.m
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "XBaseTableViewCell.h"

@interface XBaseTableViewCell()
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *firstLineDetailLabel;
@property (nonatomic, strong) UILabel *secondLineDetailLabel;
@property (nonatomic, strong) UILabel *thirdLineDetailLabel;
@property (nonatomic, strong) UILabel *forthLineDetailLabel;
@property (nonatomic, strong) UILabel *fifthLineDetailLabel;
@property (nonatomic, strong) UILabel *sixthLineDetailLabel;
@property (nonatomic, strong) UILabel *seventhLineDetailLabel;
@end

@implementation XBaseTableViewCell
#pragma - public method
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews {
    [self createLabel:_firstLineDetailLabel];
    [self createLabel:_secondLineDetailLabel];
    [self createLabel:_thirdLineDetailLabel];
    [self createLabel:_forthLineDetailLabel];
    [self createLabel:_fifthLineDetailLabel];
    [self createLabel:_sixthLineDetailLabel];
    [self createLabel:_seventhLineDetailLabel];
    [self addLayoutSubViews];
}

-(void)addLayoutSubViews {
    
}

-(void)updateLayoutSubViews {
    
}

#pragma - private method
-(void)addHeaderImageView {
    self.headerImageView = [UIImageView new];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.headerImageView];
}

-(void)addTitlLabel {
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    self.titleLabel.textColor = [UIColor darkTextColor];
    [self.contentView addSubview:self.titleLabel];
}

-(void)createLabel:(UILabel *)label {
    label = [[UILabel alloc] init];
    label.textColor = [UIColor lightTextColor];
    label.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:label];
}

@end
