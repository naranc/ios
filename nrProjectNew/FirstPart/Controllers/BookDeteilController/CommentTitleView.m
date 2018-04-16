//
//  CommentTitleView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "CommentTitleView.h"

@implementation CommentTitleView

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
        [self addSubview:self.commentBtn];
    }
    return self;
}

- (ImageTextButton *)commentBtn
{
    if (!_commentBtn) {
        _commentBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentBtn.frame = CGRectMake(15, 19, SCREEN_WIDTH - 30, 20);
        _commentBtn.midSpacing = 9;
        _commentBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _commentBtn.imageSize = CGSizeMake(14, 14);
        [_commentBtn setTitle:@"评论（13条）" forState:UIControlStateNormal];
        [_commentBtn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _commentBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_commentBtn setImage:[UIImage imageNamed:@"icon_pinglun"] forState:UIControlStateNormal];
    }
    return _commentBtn;
}
@end
