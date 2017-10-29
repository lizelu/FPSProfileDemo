//
//  XBaseTableViewCell.m
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "XBaseTableViewCell.h"
@interface XBaseTableViewCell()
@property (nonatomic, strong) dispatch_group_t attrGroup;
@end
@implementation XBaseTableViewCell
#pragma - public method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.attrGroup = dispatch_group_create();
        [self setupSubviews];
    }
    return self;
}
- (void)setCellInfo:(MyCustomModel *)model {
    self.model = model;
    [self.headerImageView setImage:[UIImage imageNamed:model.headerImageName]];
    [self setAttributeStringToLabel:self.titleLabel text:model.title];
    [self setAttributeStringToLabel:self.firstLineDetailLabel text:model.firstText];
    [self setAttributeStringToLabel:self.secondLineDetailLabel text:model.secondText];
    [self setAttributeStringToLabel:self.thirdLineDetailLabel text:model.thirdText];
    [self setAttributeStringToLabel:self.forthLineDetailLabel text:model.forthText];
    [self setAttributeStringToLabel:self.fifthLineDetailLabel text:model.fifthText];
    [self setAttributeStringToLabel:self.sixthLineDetailLabel text:model.sixthText];
    [self setAttributeStringToLabel:self.seventhLineDetailLabel text:model.seventhText];
    [self setAttributeStringToLabel:self.eighthLineDetailLabel text:model.eighthText];
    [self setAttributeStringToLabel:self.ninthLineDetailLabel text:model.ninthText];
    [self setAttributeStringToLabel:self.tenthLineDetailLabel text:model.tenthText];
    [self updateLayoutSubViews];
    
//    dispatch_group_wait(self.attrGroup, DISPATCH_TIME_FOREVER);
//    dispatch_group_notify(self.attrGroup, dispatch_get_main_queue(), ^{
//        [self updateLayoutSubViews];
//    });
}

-(void)setAttributeStringToLabel:(UILabel *)label text:(NSString *)text {
    [self setAttributeStringToLabelInMainThread:label text:text];
//    [self setAttributeStringToLabelInSubThread:label text:text];
}

-(void)setAttributeStringToLabelInMainThread:(UILabel *)label text:(NSString *)text {
    
    uint32_t offset = arc4random_uniform(text.length);
    uint32_t length = arc4random_uniform(text.length - offset);
    // 命中词语高亮显示
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange range = NSMakeRange(offset, length);
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
    label.attributedText = attrString;
}

-(void)setAttributeStringToLabelInSubThread:(UILabel *)label text:(NSString *)text {
    dispatch_group_enter(self.attrGroup);
    dispatch_group_async(self.attrGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        uint32_t offset = arc4random_uniform(text.length);
        uint32_t length = arc4random_uniform(text.length - offset);
        // 命中词语高亮显示
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
        NSRange range = NSMakeRange(offset, length);
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
        dispatch_async(dispatch_get_main_queue(), ^{
            label.attributedText = attrString;
        });
        dispatch_group_leave(self.attrGroup);
    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        uint32_t offset = rand() % text.length;
//        uint32_t length = offset + rand() % (text.length - offset);
//        // 命中词语高亮显示
//        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
//        NSRange range = NSMakeRange(offset, length);
//        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            label.attributedText = attrString;
//        });
//    });
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
    _eighthLineDetailLabel = [self createDetailLabel];
    _ninthLineDetailLabel = [self createDetailLabel];
    _tenthLineDetailLabel = [self createDetailLabel];
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
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    self.titleLabel.textColor = [UIColor darkTextColor];
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.backgroundColor = [UIColor whiteColor];
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
    label.font = [UIFont systemFontOfSize:12.0f];
    label.layer.masksToBounds = YES;
    label.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:label];
    return label;
}

@end
