//
//  WantBookView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "WantBookView.h"

@implementation WantBookView

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
        [self addSubview:self.wantBtn];
        [self addSubview:self.lineView];
    }
    return self;
}

- (ImageTextButton *)wantBtn
{
    if (!_wantBtn) {
        _wantBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _wantBtn.frame = CGRectMake(15, 16, SCREEN_WIDTH - 30, 21);
        _wantBtn.midSpacing = 9;
        _wantBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _wantBtn.imageSize = CGSizeMake(14, 14);
        [_wantBtn setTitle:@"预约的人（5）" forState:UIControlStateNormal];
        [_wantBtn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _wantBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_wantBtn setImage:[UIImage imageNamed:@"icon_xiangyaoderen"] forState:UIControlStateNormal];
    }
    return _wantBtn;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.frame = CGRectMake(0, 49, SCREEN_WIDTH, 1);
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
}
- (void)creatWantPersonUserImageViewWithArray:(NSArray *)array
{
    CGFloat left = 15;
    CGFloat space = (SCREEN_WIDTH - 15 - 200)/5;
    CGFloat top = 64;
    
    for (int i = 0; i < array.count; i ++) {
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(left + i*(space+40) , top, 40, 40);
        imageView.layer.cornerRadius = 20;
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:array[i]];
        [self addSubview:imageView];
    }
}
@end
