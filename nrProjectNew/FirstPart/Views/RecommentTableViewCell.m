//
//  RecommentTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "RecommentTableViewCell.h"
#import "RecommendModel.h"

@interface RecommentTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * bgImageview;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) UIButton * allContentBtn;

@property (nonatomic, strong) ImageTextButton * timeBtn;

@end

@implementation RecommentTableViewCell

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
        [self addSubview:self.timeBtn];
        [self addSubview:self.bgView];
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.timeLabel];
        [_bgView addSubview:self.bgImageview];
        [_bgView addSubview:self.contentLabel];
        [_bgView addSubview:self.allContentBtn];
        
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
        _bgImageview.frame = CGRectMake(15, 68, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 30) * 157 / 345);
        _bgImageview.clipsToBounds = YES;
        _bgImageview.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bgImageview;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 18, SCREEN_WIDTH - 30, 22);
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

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        UIFont * timeFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(15, _titleLabel.bottom + 4, SCREEN_WIDTH - 30, 16);
        _timeLabel.font = timeFont;
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _timeLabel;
}
- (ImageTextButton *)timeBtn
{
    if (!_timeBtn) {
        _timeBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _timeBtn.midSpacing = 8;
        _timeBtn.frame = CGRectMake(15, 16, 200, 25);
        _timeBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        _timeBtn.imageSize = CGSizeMake(16, 16);
        [_timeBtn setTitle:@"12月第一周" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:kUIColorFromRGB(0x2A2A2A) forState:UIControlStateNormal];
        _timeBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_timeBtn setImage:[UIImage imageNamed:@"mztj_btn_rili"] forState:UIControlStateNormal];
    }
    return _timeBtn;
}
- (UIButton *)allContentBtn
{
    if (!_allContentBtn) {
        _allContentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_allContentBtn setTitle:@"查看全文" forState:UIControlStateNormal];
        [_allContentBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _allContentBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    }
    return _allContentBtn;
}
- (void)configCellWithModel:(RecommendModel *)model indexPath:(NSIndexPath *)indexPath;
{
    
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model.contentBody width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    
    CGFloat realHeight;
    
    if (rect.size.height > 60) {
        realHeight = 60;
    }else{
        realHeight = rect.size.height;
    }

    _bgView.frame = CGRectMake(0, 49, SCREEN_WIDTH, (SCREEN_WIDTH - 30) * 157 / 345 + 68 + 8 + realHeight + 44);
    
    _contentLabel.frame = CGRectMake(15, _bgImageview.bottom + 8, SCREEN_WIDTH - 30, realHeight);
    
    _allContentBtn.frame = CGRectMake(15, _contentLabel.bottom + 12, 60, 20);
    
    _titleLabel.text = model.contentTitle;
    
    _contentLabel.text = model.contentBody;
    
    _timeLabel.text = [[GlobalSingleton Singleton] compareCurrentTime:model.createTime];
    
    [_bgImageview sd_setImageWithURL:[NSURL URLWithString:model.contentImg] placeholderImage:nil];
    
    [_timeBtn setTitle:model.recommendTime forState:UIControlStateNormal];

}
@end
