//
//  SubjectTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "SubjectTableViewCell.h"

@interface SubjectTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * bgImageview;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nickNameLabel;

@property (nonatomic, strong) UILabel * markLabel;

@property (nonatomic, strong) ImageTextButton * shareBtn;

@property (nonatomic, strong) ImageTextButton * commentBtn;

@property (nonatomic, strong) ImageTextButton * collectBtn;

@end

@implementation SubjectTableViewCell

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
        [_bgView addSubview:self.bgImageview];
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.contentLabel];
        [_bgView addSubview:self.userImageView];
        [_bgView addSubview:self.nickNameLabel];
        [_bgView addSubview:self.markLabel];
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
- (UIImageView *)bgImageview
{
    if (!_bgImageview) {
        _bgImageview = [[UIImageView alloc] init];
        _bgImageview.frame = CGRectMake(15, 13, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 30) * 157 / 345);
        _bgImageview.clipsToBounds = YES;
        _bgImageview.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageview.image = [UIImage imageNamed:@"xhdpibanner.png"];
    }
    return _bgImageview;
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
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, _bgImageview.bottom + 8, SCREEN_WIDTH - 30, 22);
        _titleLabel.font = titleFont;
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = titleFont;
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        UIFont * timeFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.font = timeFont;
        _nickNameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _nickNameLabel;
}
- (UILabel *)markLabel
{
    if (!_markLabel) {
        UIFont * timeFont = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _markLabel = [[UILabel alloc] init];
        _markLabel.font = timeFont;
        _markLabel.textAlignment = NSTextAlignmentCenter;
        _markLabel.textColor = kUIColorFromRGB(0x65BCFF);
        _markLabel.layer.cornerRadius = 7.0f;
        _markLabel.layer.borderWidth = 0.5f;
        _markLabel.layer.borderColor = kUIColorFromRGB(0x65BCFF).CGColor;
    }
    return _markLabel;
}
- (ImageTextButton *)shareBtn
{
    if (!_shareBtn) {
        _shareBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.midSpacing = 2;
        _shareBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _shareBtn.imageSize = CGSizeMake(15, 15);
        [_shareBtn setTitle:@"11" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _shareBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_shareBtn setImage:[UIImage imageNamed:@"list_btn_fengxiang"] forState:UIControlStateNormal];
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
        [_commentBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _commentBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_commentBtn setTitle:@"11" forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@"list_btn_pinglun"] forState:UIControlStateNormal];
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
        [_collectBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _collectBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_collectBtn setImage:[UIImage imageNamed:@"list_btn_shoucang"] forState:UIControlStateNormal];
        _collectBtn.tag = 1003;
        [_collectBtn setTitle:@"11" forState:UIControlStateNormal];
        //        [_collectBtn addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}

- (void)configCellWithModel:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath;
{
    
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    CGFloat realHeight;
    if (rect.size.height > 60) {
        realHeight = 60;
    }else{
        realHeight = rect.size.height;
    }
    
    _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, (SCREEN_WIDTH - 30) * 157 / 345 + 13 + 8 + 22 + 4 + 66 + realHeight);
    
    _contentLabel.frame = CGRectMake(15, _titleLabel.bottom + 4, SCREEN_WIDTH - 30, realHeight);

    _userImageView.frame = CGRectMake(15, _contentLabel.bottom + 12, 40, 40);

    _nickNameLabel.frame = CGRectMake(_userImageView.right + 6, _contentLabel.bottom + 14, 250, 20);

    _markLabel.frame = CGRectMake(_userImageView.right + 6, _nickNameLabel.bottom, 50, 14);

    _nickNameLabel.text = @"a测试111";
    _markLabel.text = @"那然小白";
    _titleLabel.text = model[@"title"];
    _contentLabel.text = model[@"content"];
    
    
    _collectBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 40 , _contentLabel.bottom + 22, 40, 17);
    
    _commentBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 40 - 10 - 40 , _contentLabel.bottom + 22, 40, 17);
    
    _shareBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 40 - 10 - 40 - 10 - 40, _contentLabel.bottom + 22, 40, 17);

}

@end
