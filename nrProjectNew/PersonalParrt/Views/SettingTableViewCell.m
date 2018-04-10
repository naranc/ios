//
//  SettingTableViewCell.m
//  naran
//
//  Created by 那然 on 2017/5/11.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier showSwitchBtn:(BOOL)showSwitchBtn
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.optionalImageView];
        [self.contentView addSubview:self.optionalabel];
        [self.contentView addSubview:self.forwordImageview];
        if (showSwitchBtn) {
            _forwordImageview.hidden = YES;
            UISwitch * switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 15 - 55, 6, 40, 40)];
            switchBtn.on = YES;
            [self.contentView addSubview:switchBtn];
        }
        
        UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 45.5f, SCREEN_WIDTH - 0, 0.5)];
        lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        

    }
    return self;
}
- (void)layoutSubviews
{
    _optionalImageView.frame = CGRectMake(15, (46-22) / 2, 22, 22);
    _optionalabel.frame = CGRectMake(_optionalImageView.right + 11, _optionalImageView.top, 200, 22);
    _forwordImageview.frame = CGRectMake(SCREEN_WIDTH - 6.4 - 15, 17.9, 6.4, 14.1);
}
- (UILabel *)optionalabel
{
    if (!_optionalabel) {
        UIFont * optionalFont = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _optionalabel = [[UILabel alloc] init];
        _optionalabel.font = optionalFont;
        _optionalabel.textColor = kUIColorFromRGB(0x666666);
        _optionalabel.textAlignment = NSTextAlignmentLeft;
    }
    return _optionalabel;
}
- (UIImageView *)optionalImageView
{
    if (!_optionalImageView) {
        _optionalImageView = [[UIImageView alloc] init];
        _optionalImageView.contentMode = UIViewContentModeScaleAspectFit;
        _optionalImageView.clipsToBounds = YES;
    }
    return _optionalImageView;
}
- (UIImageView *)forwordImageview
{
    if (!_forwordImageview) {
        _forwordImageview = [[UIImageView alloc] init];
//        _forwordImageview.frame = CGRectMake(SCREEN_WIDTH - 6.4 - 15, 17.9, 6.4, 14.1);
        _forwordImageview.image = [UIImage imageNamed:@"me_forword"];
    }
    return _forwordImageview;
}

@end
