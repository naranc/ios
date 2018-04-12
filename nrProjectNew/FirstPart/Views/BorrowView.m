//
//  BorrowView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BorrowView.h"

@implementation BorrowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self addSubview:self.picImageView];
        [self addSubview:self.nameLabel];
    }
    return self;
}
- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.frame = CGRectMake(0, 0, 80, 119);
        _picImageView.backgroundColor = [UIColor yellowColor];
    }
    return _picImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(0, _picImageView.bottom + 6, 80, 20);
        _nameLabel.text = @"红楼梦";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        _nameLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _nameLabel;
}
@end
