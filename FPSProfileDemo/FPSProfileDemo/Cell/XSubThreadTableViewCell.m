//
//  XSubThreadTableViewCell.m
//  FPSProfileDemo
//
//  Created by lizelu on 2017/10/30.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "XSubThreadTableViewCell.h"
@interface XSubThreadTableViewCell()
@property (nonatomic, strong) dispatch_group_t attrGroup;
@end

@implementation XSubThreadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.attrGroup = dispatch_group_create();
    }
    return self;
}

- (void)setCellInfo:(MyCustomModel *)model {
    [super setCellInfo:model];
    dispatch_group_wait(self.attrGroup, DISPATCH_TIME_FOREVER);
    dispatch_group_notify(self.attrGroup, dispatch_get_main_queue(), ^{
        [self updateLayoutSubViews];
    });
}

-(void)setAttributeStringToLabel:(UILabel *)label text:(NSString *)text {
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
}

@end
