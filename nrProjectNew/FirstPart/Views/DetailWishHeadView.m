//
//  DetailWishHeadView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/18.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "DetailWishHeadView.h"
#import "JGGView.h"
#import "WishModel.h"

@interface DetailWishHeadView ()

@property (nonatomic, strong) UIImageView * bgView;

@property (nonatomic, strong) UIImageView * userImageview;

@property (nonatomic, strong) UILabel * userNickNameLabel;

@property (nonatomic, strong) UILabel * typeNameLabel;

@property (nonatomic, strong) ImageTextButton * cityButton;

@property (nonatomic, strong) UIImageView * lineView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) JGGView * jgView;


@end


@implementation DetailWishHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame morePic:(BOOL)morePic model:(WishModel *)wishModel
{
    if ([super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        //多张图
        CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:wishModel.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
        
        NSArray *  tempImageArray = [wishModel.orderImgs componentsSeparatedByString:@","];//以“,”切割
        
        self.bgView.frame = CGRectMake(12, 0, SCREEN_WIDTH - 24, 162 + rect.size.height + [self getlineCount:tempImageArray.count]);
        [self addSubview:_bgView];
        
        self.userImageview.frame = CGRectMake(3, 12, 40, 40);
        [_bgView addSubview:_userImageview];
        [_userImageview sd_setImageWithURL:[NSURL URLWithString:wishModel.initiatorImg] placeholderImage:nil];
        
        
        
        self.typeNameLabel.frame = CGRectMake(_userImageview.right + 4, _userImageview.top, 60, 14);
        _typeNameLabel.text = @"那然小白";
        [_bgView addSubview:_typeNameLabel];
        
        
        self.userNickNameLabel.frame = CGRectMake(_userImageview.right + 4, _userImageview.bottom - 20, 200, 20);
        _userNickNameLabel.text = wishModel.initiatorNike;
        [_bgView addSubview:_userNickNameLabel];
        
        
        
        self.cityButton.frame = CGRectMake(_bgView.width - 3 - 45, 27, 45, 16);
        [_cityButton setTitle:wishModel.city forState:UIControlStateNormal];
        [_bgView addSubview:_cityButton];
        
        
        
        self.lineView.frame = CGRectMake(3, _userImageview.bottom + 12, _bgView.width - 6, 1);
        [_bgView addSubview:_lineView];
        
        self.titleLabel.frame = CGRectMake(3, _lineView.bottom + 12, _bgView.width - 6 - 60, 24);
        _titleLabel.text = wishModel.orderTitle;
        [_bgView addSubview:_titleLabel];
        
        
        self.contentLabel.frame = CGRectMake(3, _titleLabel.bottom + 12, _bgView.width - 6, rect.size.height);
        _contentLabel.text = wishModel.orderContent;
        [_bgView addSubview: _contentLabel];
        
        
        _jgView = [[JGGView alloc] init];
        _jgView.frame = CGRectMake(3, _contentLabel.bottom + 8, SCREEN_WIDTH - 30, [self getlineCount:tempImageArray.count]);
        [_bgView addSubview:_jgView];
        
        
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
        [_jgView JGGView:_jgView DataSource:imageArray completeBlock:^(NSInteger index, NSArray *dataSource, NSIndexPath *indexpath) {
            
        }];
        
        self.timeLabel.frame = CGRectMake(15, _jgView.bottom + 12, SCREEN_WIDTH - 30, 17);
        _timeLabel.text = @"更新于1分钟前";
        [_bgView addSubview:_timeLabel];
        
    }
    return self;
}

//一张图
- (id)initWithFrame:(CGRect)frame HasOnePic:(BOOL)hasOnePic model:(WishModel *)wishModel
{
    if ([super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:wishModel.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
        
        self.bgView.frame = CGRectMake(12, 0, SCREEN_WIDTH - 24 , 162 + rect.size.height + SCREEN_WIDTH - 30);
        [self addSubview:_bgView];
        
        self.userImageview.frame = CGRectMake(3, 12, 40, 40);
        [_bgView addSubview:_userImageview];
        [_userImageview sd_setImageWithURL:[NSURL URLWithString:wishModel.initiatorImg] placeholderImage:nil];
        
        
        self.typeNameLabel.frame = CGRectMake(_userImageview.right + 4, _userImageview.top, 60, 14);
        _typeNameLabel.text = @"那然小白";
        [_bgView addSubview:_typeNameLabel];
        
        self.userNickNameLabel.frame = CGRectMake(_userImageview.right + 4, _userImageview.bottom - 20, 200, 20);
        _userNickNameLabel.text = wishModel.initiatorNike;
        [_bgView addSubview:_userNickNameLabel];
        
        self.cityButton.frame = CGRectMake(_bgView.width - 3 - 45, 27, 45, 16);
        [_cityButton setTitle:wishModel.city forState:UIControlStateNormal];
        [_bgView addSubview:_cityButton];
        
        self.lineView.frame = CGRectMake(0, _userImageview.bottom + 12, _bgView.width - 6, 1);
        [_bgView addSubview:_lineView];
        
        self.titleLabel.frame = CGRectMake(3, _lineView.bottom + 12, _bgView.width - 6 - 60, 24);
        _titleLabel.text = wishModel.orderTitle;
        [_bgView addSubview:_titleLabel];
        
        
        self.contentLabel.frame = CGRectMake(3, _titleLabel.bottom + 12, SCREEN_WIDTH - 30, rect.size.height);
        _contentLabel.text = wishModel.orderContent;
        [_bgView addSubview: _contentLabel];
        
        
        UIImageView * oneView = [[UIImageView alloc] init];
        oneView.contentMode = UIViewContentModeScaleAspectFill;
        oneView.clipsToBounds = YES;
        oneView.frame = CGRectMake(3, _contentLabel.bottom + 8, SCREEN_WIDTH - 30, SCREEN_WIDTH - 30);
        [oneView sd_setImageWithURL:[NSURL URLWithString:wishModel.orderImgs] placeholderImage:nil];
        [_bgView addSubview:oneView];
        
        self.timeLabel.frame = CGRectMake(3, oneView.bottom + 12, _bgView.width - 6, 17);
        _timeLabel.text = @"更新于1分钟前";
        [_bgView addSubview:_timeLabel];
        
    }
    return self;
}

//无图
- (id)initWithFrame:(CGRect)frame model:(WishModel *)wishModel
{
    if ([super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:wishModel.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
        
        self.bgView.frame = CGRectMake(12, 0, SCREEN_WIDTH - 24, 165 + rect.size.height);
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
        [self addSubview:_bgView];
        
        self.userImageview.frame = CGRectMake(3, 12, 40, 40);
        [_bgView addSubview:_userImageview];
        [_userImageview sd_setImageWithURL:[NSURL URLWithString:wishModel.initiatorImg] placeholderImage:nil];
        
        
        self.typeNameLabel.frame = CGRectMake(_userImageview.right + 4, _userImageview.top, 60, 14);
        _typeNameLabel.text = @"那然小白";
        [_bgView addSubview:_typeNameLabel];
        
        self.userNickNameLabel.frame = CGRectMake(_userImageview.right + 4, _userImageview.bottom - 20, 200, 20);
        _userNickNameLabel.text = wishModel.initiatorNike;
        [_bgView addSubview:_userNickNameLabel];
        
        self.cityButton.frame = CGRectMake(_bgView.width - 3 - 45, 27, 45, 16);
        [_cityButton setTitle:wishModel.city forState:UIControlStateNormal];
        [_bgView addSubview:_cityButton];
        
        self.lineView.frame = CGRectMake(0, _userImageview.bottom + 12, SCREEN_WIDTH, 1);
        [_bgView addSubview:_lineView];
        
        self.titleLabel.frame = CGRectMake(3, _lineView.bottom + 12, SCREEN_WIDTH - 30 - 60 - 6, 24);
        _titleLabel.text = wishModel.orderTitle;
        [_bgView addSubview:_titleLabel];
        
        self.contentLabel.frame = CGRectMake(3, _titleLabel.bottom + 12, _bgView.width - 6, rect.size.height);
        _contentLabel.text = wishModel.orderContent;
        [_bgView addSubview: _contentLabel];
        
        self.timeLabel.frame = CGRectMake(3, _contentLabel.bottom + 20, _bgView.width - 6, 17);
        _timeLabel.text = @"更新于1分钟前";
        [_bgView addSubview:_timeLabel];
        
    }
    return self;
}

- (UIImageView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UIImageView *)userImageview
{
    if (!_userImageview) {
        _userImageview = [[UIImageView alloc] init];
        _userImageview.clipsToBounds = YES;
        _userImageview.layer.cornerRadius = 20;
        _userImageview.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _userImageview;
}
- (UILabel *)userNickNameLabel
{
    if (!_userNickNameLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.font = nameFont;
        _userNickNameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _userNickNameLabel;
}
- (UILabel *)typeNameLabel
{
    if (!_typeNameLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _typeNameLabel = [[UILabel alloc] init];
        _typeNameLabel.font = nameFont;
        _typeNameLabel.textAlignment = NSTextAlignmentCenter;
        _typeNameLabel.layer.cornerRadius = 7.0f;
        _typeNameLabel.layer.borderWidth = 1.0f;
        _typeNameLabel.layer.borderColor = kUIColorFromRGB(0x65BCFF).CGColor;
        _typeNameLabel.textColor = kUIColorFromRGB(0x65BCFF);
    }
    return _typeNameLabel;
}
- (ImageTextButton *)cityButton
{
    if (!_cityButton) {
        _cityButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _cityButton.midSpacing = 2;
        _cityButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _cityButton.imageSize = CGSizeMake(9.9, 11.9);
        [_cityButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _cityButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_cityButton setImage:[UIImage imageNamed:@"list_icon_weizhi"] forState:UIControlStateNormal];
    }
    return _cityButton;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = nameFont;
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = nameFont;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _contentLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
        _timeLabel.font = nameFont;
    }
    return _timeLabel;
}
- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return 112;
    }else if (count >= 4 & count < 8){
        return 224 + 8;
    }else{
        return 336 + 16;
    }
    
//    if (count < 4) {
//        return (SCREEN_WIDTH - 30 - 24) / 4;
//    }else if (count >= 4 & count < 8){
//        return ((SCREEN_WIDTH - 30 - 24) / 4 ) * 2 + 8;
//    }else{
//        return ((SCREEN_WIDTH - 30 - 24) / 4 ) * 3 + 16;
//    }
}
@end
