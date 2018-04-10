//
//  ApproveView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "ApproveView.h"


@interface ApproveView ()

@property (nonatomic , strong) UIImageView * aImageView;

@property (nonatomic , strong) UILabel * aLabel;

@property (nonatomic , strong) UIButton * approveButton;

@property (nonatomic , strong) UIButton * closeButton;

@end

@implementation ApproveView

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
        
        [self addSubview:self.aImageView];
        
        [_aImageView addSubview:self.aLabel];
        
        [_aImageView addSubview:self.approveButton];
        
        [self addSubview:self.closeButton];
        
    }
    return self;
}
- (UIImageView *)aImageView
{
    if (!_aImageView) {
        _aImageView = [[UIImageView alloc] init];
        _aImageView.contentMode = UIViewContentModeScaleAspectFill;
        _aImageView.clipsToBounds = YES;
        _aImageView.userInteractionEnabled = YES;
        _aImageView.image = [UIImage imageNamed:@"sfrz_tanchuang"];
    }
    return _aImageView;
}
- (UILabel *)aLabel
{
    if (!_aLabel) {
        _aLabel = [[UILabel alloc] init];
        _aLabel.textAlignment = NSTextAlignmentCenter;
        _aLabel.text = @"做有身份的公益参与者";
        _aLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _aLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _aLabel;
}
- (UIButton *)approveButton
{
    if (!_approveButton) {
        _approveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_approveButton setTitle:@"去认证" forState:UIControlStateNormal];
        _approveButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _approveButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_approveButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _approveButton.layer.cornerRadius = 49/2;
        _approveButton.clipsToBounds = YES;
        _approveButton.backgroundColor = MainColor;
        [_approveButton addTarget:self action:@selector(clickApproveButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _approveButton;
}
- (void)clickApproveButton:(UIButton *)btn
{
    if (self.onClickApproveButton) {
        self.onClickApproveButton();
    }
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"tanchuang_cha"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}
- (void)clickCloseButton:(UIButton *)btn
{
    if (self.onClickCloseButton) {
        self.onClickCloseButton();
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageWight = SCREEN_WIDTH - 66 * 2;
    
    CGFloat imageHeight = imageWight * 824 / 488;
    
    CGFloat top = (SCREEN_HEIGHT - (imageHeight + 30 + 34))/2;
    
    _aImageView.frame = CGRectMake(66, top, imageWight, imageHeight);
    
    _aLabel.frame = CGRectMake(0, imageHeight - 57 - 49 - 57 - 24, imageWight, 24);

    _approveButton.frame = CGRectMake(36, imageHeight - 57 - 49, imageWight - 36*2, 49);
    
    _closeButton.frame = CGRectMake((SCREEN_WIDTH - 34)/2, _aImageView.bottom + 30, 34, 34);
}
@end
