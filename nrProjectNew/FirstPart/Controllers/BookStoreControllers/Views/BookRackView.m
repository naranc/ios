//
//  BookRackView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookRackView.h"

@implementation BookRackView

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
        self.lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 4);
        [self addSubview:_lineView];
        
        self.bgView.frame = CGRectMake(0, 4, SCREEN_WIDTH, 70);
        [self addSubview:_bgView];
        
        self.markImageView.frame = CGRectMake(15, 21, 23, 29);
        [_bgView addSubview:_markImageView];
        
        self.userImageView.frame = CGRectMake(51, 15, 40, 40);
        [_bgView addSubview:_userImageView];

        self.userNickNameLabel.frame = CGRectMake(_userImageView.right + 8, 15, SCREEN_WIDTH/2 - 50, 20);
        [_bgView addSubview:_userNickNameLabel];
        
        self.contentLabel.frame = CGRectMake(_userImageView.right + 8, _userNickNameLabel.bottom + 3, SCREEN_WIDTH - 170, 20);
        [_bgView addSubview:_contentLabel];
        
        self.numberLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - 50, 23, 50, 24);
        [_bgView addSubview:_numberLabel];

    }
    return self;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xFF739A);
    }
    return _lineView;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFEAF0);
    }
    return _bgView;

}
- (UIImageView *)markImageView
{
    if (!_markImageView) {
        _markImageView = [[UIImageView alloc] init];
        _markImageView.contentMode = UIViewContentModeCenter;
        _markImageView.clipsToBounds = YES;
    }
    return _markImageView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.clipsToBounds = YES;
        _userImageView.layer.cornerRadius = 20.0f;
    }
    return _userImageView;
}
- (UILabel *)userNickNameLabel
{
    if (!_userNickNameLabel) {
        _userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.textColor = kUIColorFromRGB(0x666666);
        _userNickNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    }
    return _userNickNameLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _contentLabel;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = kUIColorFromRGB(0xF7AF39);
        _numberLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _numberLabel.textAlignment = NSTextAlignmentRight;
    }
    return _numberLabel;
}
@end
