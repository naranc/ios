//
//  AidTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AidTableViewCell.h"
#import "AidModel.h"

@interface AidTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * bgImageview;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) ImageTextButton * shareBtn;

@property (nonatomic, strong) ImageTextButton * commentBtn;

@property (nonatomic, strong) ImageTextButton * collectBtn;

@end

@implementation AidTableViewCell

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
        [_bgView addSubview:self.shareBtn];
        [_bgView addSubview:self.commentBtn];
        [_bgView addSubview:self.collectBtn];
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.timeLabel];
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
        _bgImageview.clipsToBounds = YES;
        _bgImageview.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageview.image = [UIImage imageNamed:@"xhdpibanner.png"];
    }
    return _bgImageview;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = titleFont;
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        UIFont * timeFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = timeFont;
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _timeLabel;
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
    }
    return _collectBtn;
}
- (void)layoutSubviews
{
    _bgView.frame = CGRectMake(0, 16, SCREEN_WIDTH, (SCREEN_WIDTH - 30) * 157 / 345 + 38 + 12);
    
    _bgImageview.frame = CGRectMake(15, 12, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 30) * 157 / 345);
    
    _collectBtn.frame = CGRectMake(SCREEN_WIDTH - 27 - 40 , _bgImageview.bottom - 17 - 12, 40, 17);
    
    _commentBtn.frame = CGRectMake(SCREEN_WIDTH - 27 - 40 - 10 - 40 , _bgImageview.bottom - 17 - 12, 40, 17);
    
    _shareBtn.frame = CGRectMake(SCREEN_WIDTH - 27 - 40 - 10 - 40 - 10 - 40, _bgImageview.bottom - 17 - 12, 40, 17);

    _titleLabel.frame = CGRectMake(15, _bgImageview.bottom + 6, SCREEN_WIDTH - 30 - 100, 20);
    
    _timeLabel.frame = CGRectMake(_titleLabel.right + 10, _bgImageview.bottom + 8, 90, 16);
}
- (void)configCellWithModel:(AidModel *)model indexPath:(NSIndexPath *)indexPath
{
    
    [_bgImageview sd_setImageWithURL:[NSURL URLWithString:model.activityImg] placeholderImage:nil];
    
    _titleLabel.text = model.activityTitle;
    
    if (model.shareTimes) {
        [_shareBtn setTitle:[NSString stringWithFormat:@"%@",model.shareTimes] forState:UIControlStateNormal];
    }else{
        [_shareBtn setTitle:@"0" forState:UIControlStateNormal];
    }
    
    if (model.commentTimes) {
        [_commentBtn setTitle:[NSString stringWithFormat:@"%@",model.commentTimes] forState:UIControlStateNormal];
    }else{
        [_commentBtn setTitle:@"0" forState:UIControlStateNormal];
    }
    
    if (model.realApplyTimes) {
        [_collectBtn setTitle:[NSString stringWithFormat:@"%@",model.realApplyTimes] forState:UIControlStateNormal];
    }else{
        [_collectBtn setTitle:@"0" forState:UIControlStateNormal];
    }
    
    _timeLabel.text = [[GlobalSingleton Singleton] compareCurrentTime:model.createTime];
}
@end
