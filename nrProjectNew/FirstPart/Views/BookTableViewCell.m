//
//  BookTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookTableViewCell.h"

@implementation BookTableViewCell

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
        
        [self addSubview:self.bookImageView];
        [self addSubview:self.bookNameLabel];
        [self addSubview:self.bookIntroLabel];
        [self addSubview:self.locationBtn];
        [self addSubview:self.lineView];
    }
    return self;
}


- (UIImageView *)bookImageView
{
    if (!_bookImageView) {
        _bookImageView = [[UIImageView alloc] init];
        _bookImageView.frame = CGRectMake(15, 16, 68, 68);
        _bookImageView.image = [UIImage imageNamed:@"icon_shuhuanghuzhu"];
        _bookImageView.layer.borderWidth = 0.5;
        _bookImageView.layer.borderColor = kUIColorFromRGB(0x999999).CGColor;
    }
    return _bookImageView;
}
- (UILabel *)bookNameLabel
{
    if (!_bookNameLabel) {
        _bookNameLabel = [[UILabel alloc] init];
        _bookNameLabel.frame = CGRectMake(_bookImageView.right + 15, 16, SCREEN_WIDTH - 45 - 68 - 9, 20);
        _bookNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _bookNameLabel.text = @"红楼梦";
        _bookNameLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _bookNameLabel;
}
- (UILabel *)bookIntroLabel
{
    if (!_bookIntroLabel) {
        _bookIntroLabel = [[UILabel alloc] init];
        _bookIntroLabel.frame = CGRectMake(_bookImageView.right + 15, _bookNameLabel.bottom + 4, SCREEN_WIDTH - 45 - 68 - 9, 17);
        _bookIntroLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _bookIntroLabel.text = @"国学线装，甄选权威经典底本，再现原版风采。 ";
        _bookIntroLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _bookIntroLabel;
}

- (ImageTextButton *)locationBtn
{
    if (!_locationBtn) {
        _locationBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _locationBtn.frame = CGRectMake(_bookImageView.right + 18, _bookIntroLabel.bottom + 13, 70, 16);
        _locationBtn.midSpacing = 5;
        _locationBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _locationBtn.imageSize = CGSizeMake(8, 10);
        [_locationBtn setTitle:@"3.32km" forState:UIControlStateNormal];
        [_locationBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _locationBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_locationBtn setImage:[UIImage imageNamed:@"list_icon_weizhi"] forState:UIControlStateNormal];
        
    }
    return _locationBtn;
}

- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.frame = CGRectMake(15, 99, SCREEN_WIDTH - 15, 1);
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
}
@end
