//
//  CommentBottomView.m
//  naran
//
//  Created by 那然 on 2017/4/14.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "CommentBottomView.h"

#define ButtonWight SCREEN_WIDTH/3
#define ButtonHeight 40-0.5

#define textFont [UIFont fontWithName:@"PingFangSC-Regular" size:12]
#define textColor1 MainColor
#define buttonImgeSize 15


@interface CommentBottomView ()
@property (strong, nonatomic) UIImageView * lineView;
@property (strong, nonatomic) NSArray * viewImageArray;
@end

@implementation CommentBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray
{
    if ([super initWithFrame:frame]) {
        _viewImageArray = imageArray;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lineView];
        [self addSubview:self.leftButton];
        [self addSubview:self.centerButton];
        [self addSubview:self.rightButton];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    _leftButton.frame = CGRectMake(0 , _lineView.bottom, ButtonWight, ButtonHeight);
    _centerButton.frame = CGRectMake(_leftButton.right , _lineView.bottom, ButtonWight, ButtonHeight);
    _rightButton.frame = CGRectMake(_centerButton.right , _lineView.bottom, ButtonWight, ButtonHeight);
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.image = [[GlobalSingleton Singleton] imageWithColor:kUIColorFromRGB(0xEEEEEE) size:CGSizeMake(SCREEN_WIDTH, 0.5)];
    }
    return _lineView;
}
- (ImageTextButton *)leftButton
{
    if (!_leftButton) {
        weakify(self);
        _leftButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _leftButton.midSpacing = 4;
        _leftButton.titleLabel.font = textFont;
        _leftButton.imageSize = CGSizeMake(buttonImgeSize, buttonImgeSize);
        [_leftButton setTitleColor:kUIColorFromRGB(0xF7AF39) forState:UIControlStateNormal];
        _leftButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_leftButton setImage:[UIImage imageNamed:_viewImageArray[0]] forState:UIControlStateNormal];
        [_leftButton addAction:^(UIButton *btn) {
            if (weakSelf.onClickShareButton) {
                weakSelf.onClickShareButton();
            }
        } forControlEvents:UIControlEventTouchUpInside];

    }
    return _leftButton;
}
- (ImageTextButton *)centerButton
{
    if (!_centerButton) {
        weakify(self);
        _centerButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _centerButton.midSpacing = 4;
        _centerButton.titleLabel.font = textFont;
        _centerButton.imageSize = CGSizeMake(buttonImgeSize, buttonImgeSize);
        [_centerButton setTitleColor:kUIColorFromRGB(0x4FCD9E) forState:UIControlStateNormal];
        _centerButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_centerButton setImage:[UIImage imageNamed:_viewImageArray[1]] forState:UIControlStateNormal];
        [_centerButton addAction:^(UIButton *btn) {
            if (weakSelf.onClickCollectButton) {
                weakSelf.onClickCollectButton();
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}
- (ImageTextButton *)rightButton
{
    if (!_rightButton) {
        weakify(self);
        _rightButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _rightButton.midSpacing = 4;
        _rightButton.titleLabel.font = textFont;
        _rightButton.imageSize = CGSizeMake(buttonImgeSize, buttonImgeSize);
        [_rightButton setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _rightButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_rightButton setImage:[UIImage imageNamed:_viewImageArray[2]] forState:UIControlStateNormal];
        [_rightButton addAction:^(UIButton *btn) {
            if (weakSelf.onClickCommentButton) {
                weakSelf.onClickCommentButton();
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}
- (void)setLeftCount:(NSInteger)leftCount
{
    [_leftButton setTitle:[NSString stringWithFormat:@"%ld",leftCount] forState:UIControlStateNormal];
}
- (void)setCenterCount:(NSInteger)centerCount
{
    [_centerButton setTitle:[NSString stringWithFormat:@"%ld",centerCount] forState:UIControlStateNormal];
}
- (void)setRightCount:(NSInteger)rightCount
{
    [_rightButton setTitle:[NSString stringWithFormat:@"%ld",rightCount] forState:UIControlStateNormal];
}
- (void)setLeftImageStr:(NSString *)leftImageStr
{
    [_leftButton setImage:[UIImage imageNamed:leftImageStr] forState:UIControlStateNormal];
}
- (void)setCenterImageStr:(NSString *)centerImageStr
{
    [_centerButton setImage:[UIImage imageNamed:centerImageStr] forState:UIControlStateNormal];
}
- (void)setRightImageStr:(NSString *)rightImageStr
{
    [_rightButton setImage:[UIImage imageNamed:rightImageStr] forState:UIControlStateNormal];
}
@end
