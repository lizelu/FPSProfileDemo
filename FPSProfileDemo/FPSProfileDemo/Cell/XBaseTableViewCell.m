//
//  XBaseTableViewCell.m
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "XBaseTableViewCell.h"

@implementation XBaseTableViewCell
#pragma - public method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}
- (void)setCellInfo:(MyCustomModel *)model {
    self.model = model;
    [self.headerImageView setImage:[UIImage imageNamed:model.headerImageName]];
    self.titleLabel.text = model.title;
    self.firstLineDetailLabel.text = model.firstText;
    self.secondLineDetailLabel.text = model.secondText;
    self.thirdLineDetailLabel.text = model.thirdText;
    self.forthLineDetailLabel.text = model.forthText;
    self.fifthLineDetailLabel.text = model.fifthText;
    self.sixthLineDetailLabel.text = model.sixthText;
    self.seventhLineDetailLabel.text = model.seventhText;
    [self updateLayoutSubViews];
}

- (void)setupSubviews {
    [self addHeaderImageView];
    [self addTitlLabel];
    _firstLineDetailLabel = [self createDetailLabel];
    _secondLineDetailLabel = [self createDetailLabel];
    _thirdLineDetailLabel = [self createDetailLabel];
    _forthLineDetailLabel = [self createDetailLabel];
    _fifthLineDetailLabel = [self createDetailLabel];
    _sixthLineDetailLabel = [self createDetailLabel];
    _seventhLineDetailLabel = [self createDetailLabel];
    [self addLineView];
    [self addLayoutSubViews];
}

- (void)addLayoutSubViews {
    //子类重写
}

- (void)updateLayoutSubViews {
    //子类重写
}



#pragma - private method
- (void)addHeaderImageView {
    self.headerImageView = [UIImageView new];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.headerImageView];
}

- (void)addTitlLabel {
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    self.titleLabel.textColor = [UIColor darkTextColor];
    [self.contentView addSubview:self.titleLabel];
}

-(void)addLineView {
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:self.lineView];
}

- (UILabel *)createDetailLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:label];
    return label;
}

@end
