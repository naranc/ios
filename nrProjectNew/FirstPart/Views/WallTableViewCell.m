//
//  WallTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "WallTableViewCell.h"

@interface WallTableViewCell ()

//@property (strong, nonatomic) UIView * leftShadowImageView;
//
//@property (strong, nonatomic) UIView * rightShadowImageView;

@property (strong, nonatomic) UIImageView * wishImageView;

@property (strong, nonatomic) UIImageView * donateImageView;

//@property (strong, nonatomic) UIImageView * wishTImageView;
//
//@property (strong, nonatomic) UIImageView * donateTImageView;
//
//@property (strong, nonatomic) UILabel * wishDesLabel;
//
//@property (strong, nonatomic) UILabel * donateDesLabel;

@end

@implementation WallTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.wishImageView];
//        [_leftShadowImageView addSubview:self.leftImageView];
        [self.contentView addSubview:self.donateImageView];
//        [_rightShadowImageView addSubview:self.rightImageView];
        
//        [_leftImageView addSubview:self.wishImageView];
//        [_rightImageView addSubview:self.donateImageView];
//        [_leftShadowImageView addSubview:self.wishTImageView];
//        [_rightImageView addSubview:self.donateTImageView];
//        [_leftImageView addSubview:self.wishDesLabel];
//        [_rightImageView addSubview:self.donateDesLabel];
    }
    return self;
}
//- (UIView *)leftShadowImageView
//{
//    if (!_leftShadowImageView) {
//        _leftShadowImageView = [[UIView alloc] init];
//        _leftShadowImageView.layer.shadowColor = kUIColorFromRGB(0x000000).CGColor;
//        _leftShadowImageView.layer.shadowOffset = CGSizeMake(0, 0);
//        _leftShadowImageView.layer.shadowOpacity = 0.5;
//        _leftShadowImageView.layer.shadowRadius = 1.0;
//        _leftShadowImageView.layer.cornerRadius = 4.0;
//        _leftShadowImageView.clipsToBounds = NO;
//    }
//    return _leftShadowImageView;
//}
//- (UIView *)rightShadowImageView
//{
//    if (!_rightShadowImageView) {
//        _rightShadowImageView = [[UIView alloc] init];
//        _rightShadowImageView.layer.shadowColor = kUIColorFromRGB(0x000000).CGColor;
//        _rightShadowImageView.layer.shadowOffset = CGSizeMake(0, 0);
//        _rightShadowImageView.layer.shadowOpacity = 0.5;
//        _rightShadowImageView.layer.shadowRadius = 1.0;
//        _rightShadowImageView.layer.cornerRadius = 4.0;
//        _rightShadowImageView.clipsToBounds = NO;
//    }
//    return _rightShadowImageView;
//}
//- (UIImageView *)leftImageView
//{
//    if (!_leftImageView) {
//        _leftImageView = [[UIImageView alloc] init];
//        _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
//        _leftImageView.clipsToBounds = YES;
//        _leftImageView.layer.cornerRadius = 4.0f;
////        _leftImageView.image = [UIImage imageNamed:@"index_juanzengqiang"];
//        _leftImageView.backgroundColor = [UIColor whiteColor];
//    }
//    return _leftImageView;
//}
//
//- (UIImageView *)rightImageView
//{
//    if (!_rightImageView) {
//        _rightImageView = [[UIImageView alloc] init];
//        _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
//        _rightImageView.clipsToBounds = YES;
//        _rightImageView.layer.cornerRadius = 4.0f;
//        _rightImageView.backgroundColor = [UIColor whiteColor];
////        _rightImageView.image = [UIImage imageNamed:@"index_juanzengqiang"];
//    }
//    return _rightImageView;
//}
- (UIImageView *)wishImageView
{
    if (!_wishImageView) {
        _wishImageView = [[UIImageView alloc] init];
        _wishImageView.contentMode = UIViewContentModeCenter;
        _wishImageView.image = [UIImage imageNamed:@"xinyuanqiang"];
        _wishImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapWishImageAction)];
        [_wishImageView addGestureRecognizer:singleTap];
    }
    return _wishImageView;

}
- (void)tapWishImageAction
{
    if (self.onClickWishImageButton) {
        self.onClickWishImageButton();
    }
}
- (UIImageView *)donateImageView
{
    if (!_donateImageView) {
        _donateImageView = [[UIImageView alloc] init];
        _donateImageView.contentMode = UIViewContentModeCenter;
        _donateImageView.image = [UIImage imageNamed:@"juanzengqiang"];
        _donateImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDonateImageAction)];
        [_donateImageView addGestureRecognizer:singleTap];

    }
    return _donateImageView;
    
}
- (void)tapDonateImageAction
{
    if (self.onClickDonateImageButton) {
        self.onClickDonateImageButton();
    }
}
//- (UIImageView *)wishTImageView
//{
//    if (!_wishTImageView) {
//        _wishTImageView = [[UIImageView alloc] init];
//        _wishTImageView.image = [UIImage imageNamed:@"index_xinyuanqiang -1"];
//        _wishTImageView.contentMode = UIViewContentModeCenter;
//        _wishTImageView.clipsToBounds = YES;
//    }
//    return _wishTImageView;
//}
//- (UIImageView *)donateTImageView
//{
//    if (!_donateTImageView) {
//        _donateTImageView = [[UIImageView alloc] init];
//        _donateTImageView.image = [UIImage imageNamed:@"index_juanzengqiang-1"];
//        _donateTImageView.contentMode = UIViewContentModeCenter;
//        _donateTImageView.clipsToBounds = YES;
//    }
//    return _donateTImageView;
//}
//- (UILabel *)wishDesLabel
//{
//    if (!_wishDesLabel) {
//        _wishDesLabel = [[UILabel alloc] init];
//        _wishDesLabel.textColor = kUIColorFromRGB(0x999999);
//        _wishDesLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
//        _wishDesLabel.text = @"如有所需 欢迎许愿";
//    }
//    return _wishDesLabel;
//}
//- (UILabel *)donateDesLabel
//{
//    if (!_donateDesLabel) {
//        _donateDesLabel = [[UILabel alloc] init];
//        _donateDesLabel.textColor = kUIColorFromRGB(0x999999);
//        _donateDesLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
//        _donateDesLabel.text = @"赠人玫瑰 手有余香";
//    }
//    return _donateDesLabel;
//}
- (void)layoutSubviews
{
//    return (SCREEN_WIDTH - 29 - 29 - 27) / 2 * 208 / 322 + 16;

//    CGFloat wight = (SCREEN_WIDTH - 50 - 27) / 2;
//    _leftShadowImageView.frame = CGRectMake(25, 6, wight, 88);
//    _rightShadowImageView.frame = CGRectMake(_leftShadowImageView.right + 27, 6, wight, 88);
//
//    _leftImageView.frame = _leftShadowImageView.bounds;
//    _rightImageView.frame = _rightShadowImageView.bounds;
//
    _wishImageView.frame = CGRectMake(29, 8, (SCREEN_WIDTH - 29 - 29 - 27) / 2, (SCREEN_WIDTH - 29 - 29 - 27) / 2 * 208 / 322);
    
    _donateImageView.frame = CGRectMake(_wishImageView.right + 27, 8, (SCREEN_WIDTH - 29 - 29 - 27) / 2, (SCREEN_WIDTH - 29 - 29 - 27) / 2 * 208 / 322);
    
//    _wishTImageView.frame = CGRectMake(8, 24, 55, 22);
//    _donateTImageView.frame = CGRectMake(8, 24, 55, 22);
//    _wishDesLabel.frame = CGRectMake(8, 50, 85, 14);
//    _donateDesLabel.frame = CGRectMake(8, 50, 85, 14);


}

@end
