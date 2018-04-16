//
//  OldLevelTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "OldLevelTableViewCell.h"

@interface OldLevelTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation OldLevelTableViewCell

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
        _oldLevel = @"ALL_NEW";

        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.yesButton];
        [_bgView addSubview:self.nineButton];
        [_bgView addSubview:self.sevenButton];
        [_bgView addSubview:self.sixButton];
    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 97);
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 16, 300, 21);
        _titleLabel.text = @"新旧程度";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}

- (UIButton *)yesButton
{
    if (!_yesButton) {
        _yesButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _yesButton.frame = CGRectMake(15, _titleLabel.bottom + 16, 44, 28);
        [_yesButton setTitle:@"全新" forState:UIControlStateNormal];
        _yesButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _yesButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _yesButton.backgroundColor = MainColor;
        [_yesButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _yesButton.layer.borderWidth = 0.5f;
        _yesButton.layer.cornerRadius = 28/2;
        _yesButton.layer.borderColor = MainColor.CGColor;
        _yesButton.clipsToBounds = YES;
        _yesButton.tag = 1001;
        [_yesButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesButton;
}

- (UIButton *)nineButton
{
    if (!_nineButton) {
        _nineButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _nineButton.frame = CGRectMake(_yesButton.right + 24, _titleLabel.bottom + 16, 57, 28);
        [_nineButton setTitle:@"九成新" forState:UIControlStateNormal];
        _nineButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _nineButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_nineButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _nineButton.layer.borderWidth = 0.5f;
        _nineButton.layer.cornerRadius = 28/2;
        _nineButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _nineButton.clipsToBounds = YES;
        _nineButton.tag = 1002;
        [_nineButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nineButton;
}

- (UIButton *)sevenButton
{
    if (!_sevenButton) {
        _sevenButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sevenButton.frame = CGRectMake(_nineButton.right + 24, _titleLabel.bottom + 16, 57, 28);
        [_sevenButton setTitle:@"七成新" forState:UIControlStateNormal];
        _sevenButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _sevenButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _sevenButton.layer.borderWidth = 0.5f;
        _sevenButton.layer.cornerRadius = 28/2;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.clipsToBounds = YES;
        _sevenButton.tag = 1003;
        [_sevenButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sevenButton;
}

- (UIButton *)sixButton
{
    if (!_sixButton) {
        _sixButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sixButton.frame = CGRectMake(_sevenButton.right + 24, _titleLabel.bottom + 16, 85, 28);
        [_sixButton setTitle:@"六成新以下" forState:UIControlStateNormal];
        _sixButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _sixButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_sixButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _sixButton.layer.borderWidth = 0.5f;
        _sixButton.layer.cornerRadius = 28/2;
        _sixButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sixButton.clipsToBounds = YES;
        _sixButton.tag = 1004;
        [_sixButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sixButton;
}

- (void)clickYesOrNoSelect:(UIButton *)btn
{
    if (btn.tag == 1001) {
        _oldLevel = @"ALL_NEW";
        _yesButton.backgroundColor = MainColor;
        _nineButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sevenButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sixButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);

        
        [_yesButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_nineButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sixButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];

        
        
        _yesButton.layer.borderColor = MainColor.CGColor;
        _nineButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sixButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;

        
    }
    if (btn.tag == 1002){
        _oldLevel = @"NINE_NEW";
        _nineButton.backgroundColor = MainColor;
        _yesButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sevenButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sixButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);

        
        [_nineButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_yesButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sixButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];

        
        _nineButton.layer.borderColor = MainColor.CGColor;
        _yesButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sixButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
    }
    if (btn.tag == 1003) {
        _oldLevel = @"SEVEN_NEW";
        _sevenButton.backgroundColor = MainColor;
        _yesButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _nineButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sixButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        
        [_sevenButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_yesButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_nineButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sixButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        _sevenButton.layer.borderColor = MainColor.CGColor;
        _yesButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _nineButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sixButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        
    }
    if (btn.tag == 1004) {
        _oldLevel = @"SIX_NEW";
        _sixButton.backgroundColor = MainColor;
        _yesButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sevenButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _nineButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        [_sixButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_yesButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_nineButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        _sixButton.layer.borderColor = MainColor.CGColor;
        _yesButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _nineButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
    }
}
@end
