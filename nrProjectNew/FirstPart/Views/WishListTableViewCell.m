//
//  WishListTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/28.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "WishListTableViewCell.h"
#import "WishModel.h"

@interface WishListTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * userNickNameLabel;

@property (nonatomic, strong) UILabel * publishTimeLabel;

@property (nonatomic, strong) UIImageView * bgImageView;

@property (nonatomic, strong) ImageTextButton * shareBtn;

@property (nonatomic, strong) ImageTextButton * commentBtn;

@property (nonatomic, strong) ImageTextButton * collectBtn;

@end

@implementation WishListTableViewCell

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
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.userImageView];
        [_bgView addSubview:self.userNickNameLabel];
        [_bgView addSubview:self.publishTimeLabel];
        [_bgView addSubview:self.bgImageView];
        [_bgView addSubview:self.shareBtn];
        [_bgView addSubview:self.commentBtn];
        [_bgView addSubview:self.collectBtn];
    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.clipsToBounds = YES;
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.image = [UIImage imageNamed:@"xhdpibanner.png"];
        _userImageView.layer.cornerRadius = 20.0f;
        _userImageView.clipsToBounds = YES;
    }
    return _userImageView;
}
- (UILabel *)userNickNameLabel
{
    if (!_userNickNameLabel) {
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.font = titleFont;
        _userNickNameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _userNickNameLabel;
}

- (UILabel *)publishTimeLabel
{
    if (!_publishTimeLabel) {
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _publishTimeLabel = [[UILabel alloc] init];
        _publishTimeLabel.font = titleFont;
        _publishTimeLabel.textAlignment = NSTextAlignmentRight;
        _publishTimeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _publishTimeLabel;
}
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.clipsToBounds = YES;
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.image = [UIImage imageNamed:@"xhdpibanner.png"];
    }
    return _bgImageView;
}




- (ImageTextButton *)shareBtn
{
    if (!_shareBtn) {
        _shareBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.midSpacing = 2;
        _shareBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _shareBtn.imageSize = CGSizeMake(15, 15);
        [_shareBtn setTitle:@"11" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _shareBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_shareBtn setImage:[UIImage imageNamed:@"list_btn_fengxiang_w"] forState:UIControlStateNormal];
        _shareBtn.tag = 1001;
        //        [_shareBtn addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}
- (ImageTextButton *)commentBtn
{
    if (!_commentBtn) {
        _commentBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentBtn.midSpacing = 2;
        _commentBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _commentBtn.imageSize = CGSizeMake(16, 15);
        [_commentBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _commentBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_commentBtn setTitle:@"11" forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@"list_btn_pinglun_w"] forState:UIControlStateNormal];
        _commentBtn.tag = 1002;
        //        [_commentBtn addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}
- (ImageTextButton *)collectBtn
{
    if (!_collectBtn) {
        _collectBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _collectBtn.midSpacing = 2;
        _collectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _collectBtn.imageSize = CGSizeMake(17, 16);
        [_collectBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _collectBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_collectBtn setImage:[UIImage imageNamed:@"list_btn_shoucang_w"] forState:UIControlStateNormal];
        _collectBtn.tag = 1003;
        [_collectBtn setTitle:@"11" forState:UIControlStateNormal];
        //        [_collectBtn addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}
- (void)layoutSubviews
{
    _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_WIDTH - 30) * 238 / 345 + 60 + 12);
    
    _userImageView.frame = CGRectMake(15, 12, 40, 40);
    
    _userNickNameLabel.frame = CGRectMake(_userImageView.right + 8, 22, 200, 20);
    
    _publishTimeLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - 150, 31, 150, 15);
    
    _bgImageView.frame = CGRectMake(15, _userImageView.bottom + 8, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 30) * 238 / 345);

    _collectBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 40 , _bgImageView.bottom - 16 - 17, 40, 17);
    
    _commentBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 40 - 10 - 40 , _bgImageView.bottom -16 - 17, 40, 17);
    
    _shareBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 40 - 10 - 40 - 10 - 40, _bgImageView.bottom -16 - 17, 40, 17);

}
- (void)configCellWithModel:(WishModel *)wishModel indexPath:(NSIndexPath *)indexPath
{
    _userNickNameLabel.text = wishModel.initiatorNike;
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:wishModel.initiatorImg] placeholderImage:nil];
    
    
    
    if (wishModel.orderImgs) {
        
        NSArray * imageArray;
        if ([wishModel.orderImgs containsString:@","]) {
            imageArray = [wishModel.orderImgs componentsSeparatedByString:@","];//以“,”切割
            if (imageArray.count > 3) {
                NSArray *smallArray = [imageArray subarrayWithRange:NSMakeRange(0, 3)];
                imageArray = smallArray;
            }
        }else{
            imageArray = @[wishModel.orderImgs];
        }
        
        [_bgImageView sd_setImageWithURL:[NSURL URLWithString:imageArray[0]] placeholderImage:nil];
    }
    
    
    _publishTimeLabel.text = [[GlobalSingleton Singleton] compareCurrentTime:wishModel.createTime];


}

@end
