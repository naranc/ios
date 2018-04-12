//
//  TopSelectView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TopSelectView.h"

@implementation TopSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    if ([super init]) {
        space = (SCREEN_WIDTH - 30 - 18 - 4*60)/3;
        [self addSubview:self.loveBtn];
        [self addSubview:self.pankBtn];
        [self addSubview:self.commBtn];
        [self addSubview:self.bookBtn];

    }
    return self;
}

- (ImageTextButton *)loveBtn
{
    if (!_loveBtn) {
        _loveBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _loveBtn.frame = CGRectMake(9, 13, 60, 77);
        _loveBtn.midSpacing = 0;
        _loveBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _loveBtn.imageSize = CGSizeMake(60, 60);
        [_loveBtn setTitle:@"爱心书架" forState:UIControlStateNormal];
        [_loveBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _loveBtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_loveBtn setImage:[UIImage imageNamed:@"aixinshuwu_xunyibenshu"] forState:UIControlStateNormal];
        _loveBtn.tag = 1001;
        weakify(self);
        [_loveBtn addAction:^(UIButton *btn) {
            [weakSelf.delegate clickTopSlectType:btn.tag];
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loveBtn;
}

- (ImageTextButton *)pankBtn
{
    if (!_pankBtn) {
        _pankBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _pankBtn.frame = CGRectMake(_loveBtn.right + space, 13, 60, 77);
        _pankBtn.midSpacing = 0;
        _pankBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _pankBtn.imageSize = CGSizeMake(60, 60);
        [_pankBtn setTitle:@"书虫榜" forState:UIControlStateNormal];
        [_pankBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _pankBtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_pankBtn setImage:[UIImage imageNamed:@"aixinshuwu_paihangbnag"] forState:UIControlStateNormal];
        weakify(self);
        _pankBtn.tag =1002;
        [_pankBtn addAction:^(UIButton *btn) {
            [weakSelf.delegate clickTopSlectType:btn.tag];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _pankBtn;
}

- (ImageTextButton *)commBtn
{
    if (!_commBtn) {
        _commBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commBtn.frame = CGRectMake(_pankBtn.right + space, 13, 60, 77);
        _commBtn.midSpacing = 0;
        _commBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commBtn.imageSize = CGSizeMake(60, 60);
        [_commBtn setTitle:@"书香社区" forState:UIControlStateNormal];
        [_commBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _commBtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_commBtn setImage:[UIImage imageNamed:@"aixinshuwu_shuxiangshequ"] forState:UIControlStateNormal];
        _commBtn.tag = 1003;
        weakify(self);
        [_commBtn addAction:^(UIButton *btn) {
            [weakSelf.delegate clickTopSlectType:btn.tag];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _commBtn;
}

- (ImageTextButton *)bookBtn
{
    if (!_bookBtn) {
        _bookBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _bookBtn.frame = CGRectMake(_commBtn.right + space, 13, 60, 77);
        _bookBtn.midSpacing = 0;
        _bookBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _bookBtn.imageSize = CGSizeMake(60, 60);
        [_bookBtn setTitle:@"书摘" forState:UIControlStateNormal];
        [_bookBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _bookBtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_bookBtn setImage:[UIImage imageNamed:@"aixinshuwu_shuzhai"] forState:UIControlStateNormal];
        _bookBtn.tag = 1004;
        weakify(self);
        [_bookBtn addAction:^(UIButton *btn) {
            [weakSelf.delegate clickTopSlectType:btn.tag];
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bookBtn;
}

@end
