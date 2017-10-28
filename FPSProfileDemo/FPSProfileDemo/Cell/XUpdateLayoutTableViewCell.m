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
        make.top.left.equalTo(@10);
        make.height.equalTo(@20);
        make.right.equalTo(@(-10));
    }];
    
    [self addLayoutForDetailLabel:self.firstLineDetailLabel toLabel:self.titleLabel text:self.model.firstText];
    [self addLayoutForDetailLabel:self.secondLineDetailLabel toLabel:self.firstLineDetailLabel text:self.model.secondText];
    [self addLayoutForDetailLabel:self.thirdLineDetailLabel toLabel:self.secondLineDetailLabel text:self.model.thirdText];
    [self addLayoutForDetailLabel:self.forthLineDetailLabel toLabel:self.thirdLineDetailLabel text:self.model.forthText];
    [self addLayoutForDetailLabel:self.fifthLineDetailLabel toLabel:self.forthLineDetailLabel text:self.model.fifthText];
    [self addLayoutForDetailLabel:self.sixthLineDetailLabel toLabel:self.fifthLineDetailLabel text:self.model.sixthText];
    [self addLayoutForDetailLabel:self.seventhLineDetailLabel toLabel:self.sixthLineDetailLabel text:self.model.seventhText];
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@2);
    }];
}

- (void)addLayoutForDetailLabel:(UILabel *)label
                        toLabel:(UILabel *)toLabel
                           text:(NSString *)labelText
{
    [label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(toLabel);
        CGFloat top = 0;
        CGFloat height = 0;
        if (labelText.length) {
            top = 10;
            height = 15;
        }
        make.top.equalTo(toLabel.mas_bottom).offset(top);
        make.height.equalTo(@(height));
    }];
}
@end
