//
//  XFrameLayoutTableViewCell.m
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/29.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "XFrameLayoutTableViewCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width;
#import "UIView+Frame.h"
@implementation XFrameLayoutTableViewCell
- (void)addLayoutSubViews {
    self.headerImageView.frame = CGRectMake(0, 0, 120, 215);
    CGFloat labelX = 130.0f;
    CGFloat labelWidth = SCREEN_WIDTH - labelX - 10;
    self.titleLabel.frame = CGRectMake(labelX, 10, labelWidth, 17);
    self.firstLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.titleLabel];
    self.secondLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.firstLineDetailLabel];
    self.thirdLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.secondLineDetailLabel];
    self.forthLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.thirdLineDetailLabel];
    self.fifthLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.forthLineDetailLabel];;
    self.sixthLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.fifthLineDetailLabel];
    self.seventhLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.sixthLineDetailLabel];
    self.eighthLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.seventhLineDetailLabel];
    self.ninthLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.eighthLineDetailLabel];
    self.tenthLineDetailLabel.frame = [self createDetailFrameWithTopLabel:self.ninthLineDetailLabel];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@2);
    }];
}

-(CGRect)createDetailFrameWithTopLabel:(UILabel *)label {
    return CGRectMake(label.frame.origin.x, 5 + label.bottom, label.frame.size.width, 12);
}

- (void)updateLayoutSubViews {
    [self updateLayoutForDetailLabel:self.firstLineDetailLabel toLabel:self.titleLabel];
    [self updateLayoutForDetailLabel:self.secondLineDetailLabel toLabel:self.firstLineDetailLabel];
    [self updateLayoutForDetailLabel:self.thirdLineDetailLabel toLabel:self.secondLineDetailLabel];
    [self updateLayoutForDetailLabel:self.forthLineDetailLabel toLabel:self.thirdLineDetailLabel];
    [self updateLayoutForDetailLabel:self.fifthLineDetailLabel toLabel:self.forthLineDetailLabel];
    [self updateLayoutForDetailLabel:self.sixthLineDetailLabel toLabel:self.fifthLineDetailLabel];
    [self updateLayoutForDetailLabel:self.seventhLineDetailLabel toLabel:self.sixthLineDetailLabel];
    [self updateLayoutForDetailLabel:self.eighthLineDetailLabel toLabel:self.seventhLineDetailLabel];
    [self updateLayoutForDetailLabel:self.ninthLineDetailLabel toLabel:self.eighthLineDetailLabel];
    [self updateLayoutForDetailLabel:self.tenthLineDetailLabel toLabel:self.ninthLineDetailLabel];
}

- (void)updateLayoutForDetailLabel:(UILabel *)label toLabel:(UILabel *)toLabel
{
    CGRect frame = label.frame;
    if (label.text.length) {
        frame.origin.y = toLabel.bottom + 5;
        frame.size.height = 12;
    } else {
        frame.origin.y = toLabel.bottom;
        frame.size.height = 0;
    }
    label.frame = frame;
}

@end
