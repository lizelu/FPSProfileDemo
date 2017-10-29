//
//  XUpdateLayoutTableViewCell.m
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//  207

#import "XUpdateLayoutTableViewCell.h"

@implementation XUpdateLayoutTableViewCell

- (void)addLayoutSubViews {
    [self updateLayoutSubViews];
}

- (void)updateLayoutSubViews {
    [self.headerImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(@0);
        make.width.equalTo(@120);
    }];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(self.headerImageView.mas_right).offset(10);
        make.height.equalTo(@20);
        make.right.equalTo(@(-10));
    }];
    
    [self addLayoutForDetailLabel:self.firstLineDetailLabel toLabel:self.titleLabel];
    [self addLayoutForDetailLabel:self.secondLineDetailLabel toLabel:self.firstLineDetailLabel];
    [self addLayoutForDetailLabel:self.thirdLineDetailLabel toLabel:self.secondLineDetailLabel];
    [self addLayoutForDetailLabel:self.forthLineDetailLabel toLabel:self.thirdLineDetailLabel];
    [self addLayoutForDetailLabel:self.fifthLineDetailLabel toLabel:self.forthLineDetailLabel];
    [self addLayoutForDetailLabel:self.sixthLineDetailLabel toLabel:self.fifthLineDetailLabel];
    [self addLayoutForDetailLabel:self.seventhLineDetailLabel toLabel:self.sixthLineDetailLabel];
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@2);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)addLayoutForDetailLabel:(UILabel *)label toLabel:(UILabel *)toLabel
{
    [label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(toLabel.mas_left);
        make.right.equalTo(toLabel.mas_right);
        CGFloat top = 0;
        CGFloat height = 0;
        if (label.text.length) {
            top = 10;
            height = 15;
        }
        make.top.equalTo(toLabel.mas_bottom).offset(top);
        make.height.equalTo(@(height));
    }];
}
@end
