//
//  PersonInfoTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/20.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PersonInfoTableViewCell.h"
#import "YLProgressBar.h"

@interface PersonInfoTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * bgImageView;

@property (nonatomic, strong) UIButton * messageButton;

@property (nonatomic, strong) UIButton * settingButton;

@end

@implementation PersonInfoTableViewCell

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
        [self addSubview:self.bgImageView];
        [self addSubview:self.bgView];
        [self addSubview:self.messageButton];
        [self addSubview:self.settingButton];
        [_bgView addSubview:self.userImageView];
        [_bgView addSubview:self.nickNameL];
        [_bgView addSubview:self.introL];
        [_bgView addSubview:self.lvMarkImageView];
        [_bgView addSubview:self.lvButton];
        [_bgView addSubview:self.lvProgressBar];
        [_bgView addSubview:self.loveButton];
        [_bgView addSubview:self.loveProgressBar];
        [_bgView addSubview:self.lvLabel];
        [_bgView addSubview:self.loveLabel];
        [_bgView addSubview:self.idButton];
    }
    return self;
}
- (UIButton *)messageButton
{
    if (!_messageButton) {
        _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageButton setImage:[UIImage imageNamed:@"wode_btn_yijianfankui"] forState:UIControlStateNormal];
        [_messageButton addTarget:self action:@selector(clickMessageButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}
- (void)clickMessageButton:(UIButton *)btn
{
    if (self.onClickMessageButton) {
        self.onClickMessageButton();
    }
}
- (UIButton *)settingButton
{
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingButton setImage:[UIImage imageNamed:@"wode_shezhi"] forState:UIControlStateNormal];
        [_settingButton addTarget:self action:@selector(clickSettingButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingButton;
}
- (void)clickSettingButton:(UIButton *)btn
{
    if (self.onClickSettingButton) {
        self.onClickSettingButton();
    }
}
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.clipsToBounds = YES;
        _bgImageView.image = [UIImage imageNamed:@"wode_bj"];
    }
    return _bgImageView;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.layer.cornerRadius = 8.0f;
        _bgView.clipsToBounds = YES;
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.layer.cornerRadius = 57/2;
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.clipsToBounds = YES;
        _userImageView.userInteractionEnabled = YES;
        _userImageView.image = [UIImage imageNamed:@"xhdpibanner.png"];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction)];
        [_userImageView addGestureRecognizer:singleTap];
    }
    return _userImageView;
}
- (void)tapImageAction
{
    if (self.onClickUserImageButton) {
        self.onClickUserImageButton();
    }
}
- (UILabel *)nickNameL
{
    if (!_nickNameL){
        _nickNameL = [[UILabel alloc] init];
        _nickNameL.text = @"a测试001";
        _nickNameL.textColor = kUIColorFromRGB(0x666666);
        _nickNameL.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    }
    return _nickNameL;
}
- (UILabel *)introL
{
    if (!_introL){
        _introL = [[UILabel alloc] init];
        _introL.text = @"一句话介绍你自己喽";
        _introL.textColor = kUIColorFromRGB(0x999999);
        _introL.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _introL;
}
- (UIImageView *)lvMarkImageView
{
    if (!_lvMarkImageView) {
        _lvMarkImageView = [[UIImageView alloc] init];
        _lvMarkImageView.contentMode = UIViewContentModeScaleAspectFill;
        _lvMarkImageView.clipsToBounds = YES;
        _lvMarkImageView.backgroundColor = MainColor;
    }
    return _lvMarkImageView;
}
- (ImageTextButton *)lvButton
{
    if (!_lvButton) {
        _lvButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _lvButton.midSpacing = 4;
        _lvButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _lvButton.imageSize = CGSizeMake(12, 12);
        [_lvButton setTitle:@"LV.3" forState:UIControlStateNormal];
        [_lvButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _lvButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_lvButton setImage:[UIImage imageNamed:@"wode_icon_dengji"] forState:UIControlStateNormal];
    }
    return _lvButton;
}
- (ImageTextButton *)loveButton
{
    if (!_loveButton) {
        _loveButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _loveButton.midSpacing = 4;
        [_loveButton setTitle:@"爱心值" forState:UIControlStateNormal];
        _loveButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _loveButton.imageSize = CGSizeMake(12, 12);
        [_loveButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _loveButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_loveButton setImage:[UIImage imageNamed:@"wode_icon_aixinzhi"] forState:UIControlStateNormal];
    }
    return _loveButton;
}

- (YLProgressBar *)lvProgressBar
{
    if (!_lvProgressBar) {
        _lvProgressBar = [[YLProgressBar alloc] init];
        NSArray *tintColors = @[[UIColor colorWithRed:255/255.0f green:238/255.0f blue:162/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:236/255.0f blue:157/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:234/255.0f blue:153/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:230/255.0f blue:140/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:228/255.0f blue:130/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:225/255.0f blue:120/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:220/255.0f blue:110/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:215/255.0f blue:100/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:210/255.0f blue:90/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:205/255.0f blue:85/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:205/255.0f blue:80/255.0f alpha:1.0f]];
        
        _lvProgressBar.progressTintColors       = tintColors;
        _lvProgressBar.stripesOrientation       = YLProgressBarStripesOrientationLeft;
        _lvProgressBar.indicatorTextDisplayMode = YLProgressBarIndicatorTextDisplayModeNone;
        _lvProgressBar.hideGloss = YES;
        _lvProgressBar.hideStripes = YES;
        _lvProgressBar.hideTrack = NO;
        _lvProgressBar.progressStretch = NO;
        _lvProgressBar.trackTintColor = kUIColorFromRGB(0xf5f5f5);
        _lvProgressBar.behavior = YLProgressBarBehaviorDefault;
        [_lvProgressBar setProgress:0];
    }
    return _lvProgressBar;
}
- (YLProgressBar *)loveProgressBar
{
    if (!_loveProgressBar) {
        _loveProgressBar = [[YLProgressBar alloc] init];
        NSArray *tintColors = @[[UIColor colorWithRed:255/255.0f green:159/255.0f blue:187/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:166/255.0f blue:193/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:160/255.0f blue:186/255.0f alpha:1.0f],
                                [UIColor colorWithRed:255/255.0f green:150/255.0f blue:183/255.0f alpha:1.0f],
                                [UIColor colorWithRed:241/255.0f green:142/255.0f blue:171/255.0f alpha:1.0f],
                                [UIColor colorWithRed:238/255.0f green:134/255.0f blue:164/255.0f alpha:1.0f],
                                [UIColor colorWithRed:247/255.0f green:131/255.0f blue:161/255.0f alpha:1.0f],
                                [UIColor colorWithRed:245/255.0f green:147/255.0f blue:157/255.0f alpha:1.0f],
                                [UIColor colorWithRed:245/255.0f green:123/255.0f blue:154/255.0f alpha:1.0f],
                                [UIColor colorWithRed:245/255.0f green:134/255.0f blue:162/255.0f alpha:1.0f],
                                [UIColor colorWithRed:244/255.0f green:117/255.0f blue:149/255.0f alpha:1.0f]];
        
        _loveProgressBar.progressTintColors       = tintColors;
        _loveProgressBar.stripesOrientation       = YLProgressBarStripesOrientationLeft;
        _loveProgressBar.indicatorTextDisplayMode = YLProgressBarIndicatorTextDisplayModeNone;
        _loveProgressBar.hideGloss = YES;
        _loveProgressBar.hideStripes = YES;
        _loveProgressBar.hideTrack = NO;
        _loveProgressBar.progressStretch = NO;
        _loveProgressBar.trackTintColor = kUIColorFromRGB(0xf5f5f5);
        _loveProgressBar.behavior = YLProgressBarBehaviorDefault;
        [_loveProgressBar setProgress:0];

    }
    return _loveProgressBar;
}
- (UILabel *)lvLabel
{
    if (!_lvLabel){
        _lvLabel = [[UILabel alloc] init];
        _lvLabel.textAlignment = NSTextAlignmentRight;
        _lvLabel.text = @"200/300";
        _lvLabel.textColor = kUIColorFromRGB(0XF7AF39);
        _lvLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    }
    return _lvLabel;
}
- (UILabel *)loveLabel
{
    if (!_loveLabel){
        _loveLabel = [[UILabel alloc] init];
        _loveLabel.textAlignment = NSTextAlignmentRight;
        _loveLabel.text = @"2000";
        _loveLabel.textColor = kUIColorFromRGB(0xF67F9E);
        _loveLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    }
    return _loveLabel;
}
- (UIButton *)idButton
{
    if (!_idButton) {
        _idButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_idButton setTitle:@"申请实名认证" forState:UIControlStateNormal];
        [_idButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _idButton.backgroundColor = kUIColorFromRGB(0xBABABA);
        _idButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
        _idButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _idButton.titleEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
        [_idButton addTarget:self action:@selector(clickIDButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([[UserModel getUser].certificationType isEqualToString:@"SUCCESS"]) {
            [_idButton setTitle:@"已实名认证" forState:UIControlStateNormal];
            _idButton.backgroundColor = MainColor;
            _idButton.enabled = NO;
        }
        
        
    }
    return _idButton;
}
- (void)clickIDButton:(UIButton *)btn
{
//    if ([[UserModel getUser].certificationType isEqualToString:@"SUCCESS"]) {
//        [_idButton setTitle:@"已实名认证" forState:UIControlStateNormal];
//        _idButton.backgroundColor = MainColor;
//        return;
//    }
    if (self.onClickIDButton) {
        self.onClickIDButton();
    }
}
- (void)layoutSubviews
{
    _bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 528 / 1125);
    if ([WRNavigationBar isIphoneX]) {
        _bgView.frame = CGRectMake(15, 300 - 223 - 15 + 30, SCREEN_WIDTH - 30, 223);
        _messageButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 20 - 20 - 20, 60, 20, 20);
        _settingButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 20, 60, 20, 20);

    }else{
        _bgView.frame = CGRectMake(15, 300 - 223 - 15, SCREEN_WIDTH - 30, 223);
        _messageButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 20 - 20 - 20, 30, 20, 20);
        _settingButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 20, 30, 20, 20);

    }
    _userImageView.frame = CGRectMake(26, 20, 57, 57);
    
    _nickNameL.frame = CGRectMake(_userImageView.right + 15, 26, 100, 22);
    
    _introL.frame = CGRectMake(_userImageView.right + 15, _nickNameL.bottom + 4, 120, 17);

    _lvMarkImageView.frame = CGRectMake(_bgView.width - 23 - 50, 0, 50, 70);
    
    _lvProgressBar.frame = CGRectMake(35, 111, SCREEN_WIDTH - 30 - 70, 6);
    
    _lvButton.frame = CGRectMake(35, _lvProgressBar.top - 2 - 16, 45, 16);
    
    _loveProgressBar.frame = CGRectMake(35, _lvProgressBar.bottom + 34, SCREEN_WIDTH - 30 - 70, 6);
    
    _loveButton.frame = CGRectMake(40, _loveProgressBar.top - 2 - 16, 45, 16);
    
    CGFloat wight = (_bgView.width - 70) / 2;
    
    _lvLabel.frame = CGRectMake(wight + 35, _lvButton.top, wight, 16);
    
    _loveLabel.frame = CGRectMake(wight + 35, _loveButton.top, wight, 16);
    
    _idButton.frame = CGRectMake(0, _bgView.height - 40, _bgView.width ,40);

}
@end
