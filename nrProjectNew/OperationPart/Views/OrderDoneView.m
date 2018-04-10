//
//  OrderDoneView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/23.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "OrderDoneView.h"

@implementation OrderDoneView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = kUIColorFromRGB(0xffffff);
        
        self.layer.cornerRadius = 101/2;
        self.layer.shadowColor = kUIColorFromRGBWithAlpha(0x000000, 0.3).CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 1);
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowRadius = 1;
        
        self.dImageView.frame = CGRectMake(32, 15, 37, 31);
        [self addSubview:_dImageView];
        
        self.dTitleLabel.frame = CGRectMake((frame.size.width - 40) / 2, _dImageView.bottom + 10, 40, 12);
        [self addSubview:_dTitleLabel];
        
        self.contentLabel.frame = CGRectMake((frame.size.width - 40) / 2, _dTitleLabel.bottom + 8, 40, 12);
        [self addSubview:_contentLabel];
    }
    return self;
}
- (UIImageView *)dImageView
{
    if (!_dImageView) {
        _dImageView = [[UIImageView alloc] init];
    }
    return _dImageView;
}
- (UILabel *)dTitleLabel
{
    if (!_dTitleLabel) {
        _dTitleLabel = [[UILabel alloc] init];
        _dTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
        _dTitleLabel.textColor = kUIColorFromRGB(0x999999);
        _dTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dTitleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}
@end
