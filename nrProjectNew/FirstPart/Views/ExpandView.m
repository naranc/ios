//
//  ExpandView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/15.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "ExpandView.h"


@interface ExpandView ()

@property (nonatomic, strong) UIButton * shareButton;

@property (nonatomic, strong) UIButton * collectButton;

@property (nonatomic, strong) UIButton * commentButton;

@end

@implementation ExpandView

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
        
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat size;
        if (SCREEN_WIDTH <= 375) {
            size = 40;
        }else{
            size = 50;
        }
        self.shareButton.frame = CGRectMake(0, 0, size, size);
        self.collectButton.frame = CGRectMake(0, _shareButton.bottom + 24, size, size);
        self.commentButton.frame = CGRectMake(0, _collectButton.bottom + 24, size, size);
        [self addSubview:_shareButton];
        [self addSubview:_collectButton];
        [self addSubview:_commentButton];
    }
    return self;
}
- (UIButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:[UIImage imageNamed:@"side_btn_fenxiang"] forState:UIControlStateNormal];
        [_shareButton addAction:^(UIButton *btn) {
            if (self.onClickShareButton) {
                self.onClickShareButton();
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}
- (UIButton *)collectButton
{
    if (!_collectButton) {
        _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectButton setImage:[UIImage imageNamed:@"side_btn_shoucang_pre"] forState:UIControlStateNormal];
        [_collectButton addAction:^(UIButton *btn) {
            if (self.onClickCollectButton) {
                self.onClickCollectButton();
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectButton;
}
- (UIButton *)commentButton
{
    if (!_commentButton) {
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setImage:[UIImage imageNamed:@"side_btn_pinglun"] forState:UIControlStateNormal];
        [_commentButton addAction:^(UIButton *btn) {
            if (self.onClickCommentButton) {
                self.onClickCommentButton();
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentButton;
}
@end
