//
//  AFFBookNewTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "AFFBookNewTableViewCell.h"


@interface AFFBookNewTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation AFFBookNewTableViewCell

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
        [_bgView addSubview:self.niceButton];
        [_bgView addSubview:self.sevenButton];
        [_bgView addSubview:self.fiveButton];
        [_bgView addSubview:self.fourButton];
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
        _titleLabel.text = @"2.请判定书籍几成新";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}

- (UIButton *)niceButton
{
    if (!_niceButton) {
        _niceButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _niceButton.frame = CGRectMake(15, _titleLabel.bottom + 20, 57, 28);
        [_niceButton setTitle:@"九成新" forState:UIControlStateNormal];
        _niceButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _niceButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _niceButton.backgroundColor = MainColor;
        [_niceButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _niceButton.layer.borderWidth = 0.5f;
        _niceButton.layer.cornerRadius = 28/2;
        _niceButton.layer.borderColor = MainColor.CGColor;
        _niceButton.clipsToBounds = YES;
        _niceButton.tag = 1001;
        [_niceButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _niceButton;
}

- (UIButton *)sevenButton
{
    if (!_sevenButton) {
        _sevenButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sevenButton.frame = CGRectMake(_niceButton.right + 24, _titleLabel.bottom + 20, 57, 28);
        [_sevenButton setTitle:@"七成新" forState:UIControlStateNormal];
        _sevenButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _sevenButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _sevenButton.layer.borderWidth = 0.5f;
        _sevenButton.layer.cornerRadius = 28/2;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.clipsToBounds = YES;
        _sevenButton.tag = 1002;
        [_sevenButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sevenButton;
}

- (UIButton *)fiveButton
{
    if (!_fiveButton) {
        _fiveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _fiveButton.frame = CGRectMake(_sevenButton.right + 24, _titleLabel.bottom + 20, 57, 28);
        [_fiveButton setTitle:@"五成新" forState:UIControlStateNormal];
        _fiveButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _fiveButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_fiveButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _fiveButton.layer.borderWidth = 0.5f;
        _fiveButton.layer.cornerRadius = 28/2;
        _fiveButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fiveButton.clipsToBounds = YES;
        _fiveButton.tag = 1003;
        [_fiveButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fiveButton;
}

- (UIButton *)fourButton
{
    if (!_fourButton) {
        _fourButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _fourButton.frame = CGRectMake(_fiveButton.right + 24, _titleLabel.bottom + 20, 57, 28);
        [_fourButton setTitle:@"四成新" forState:UIControlStateNormal];
        _fourButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _fourButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_fourButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _fourButton.layer.borderWidth = 0.5f;
        _fourButton.layer.cornerRadius = 28/2;
        _fourButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fourButton.clipsToBounds = YES;
        _fourButton.tag = 1004;
        [_fourButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fourButton;
}

- (void)clickYesOrNoSelect:(UIButton *)btn
{
    if (btn.tag == 1001) {
        _oldLevel = @"ALL_NEW";
        _niceButton.backgroundColor = MainColor;
        _sevenButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _fiveButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _fourButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        
        [_niceButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_fiveButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_fourButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        
        
        _niceButton.layer.borderColor = MainColor.CGColor;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fiveButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fourButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        
        
    }
    if (btn.tag == 1002){
        _oldLevel = @"NINE_NEW";
        _sevenButton.backgroundColor = MainColor;
        _niceButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _fiveButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _fourButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        
        [_sevenButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_niceButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_fiveButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_fourButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        
        _sevenButton.layer.borderColor = MainColor.CGColor;
        _niceButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fiveButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fourButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
    }
    if (btn.tag == 1003) {
        _oldLevel = @"SEVEN_NEW";
        _fiveButton.backgroundColor = MainColor;
        _niceButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sevenButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _fourButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        
        [_fiveButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_niceButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_fourButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        _fiveButton.layer.borderColor = MainColor.CGColor;
        _niceButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fourButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        
    }
    if (btn.tag == 1004) {
        _oldLevel = @"SIX_NEW";
        _fourButton.backgroundColor = MainColor;
        _niceButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _fiveButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _sevenButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        [_fourButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_niceButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_sevenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_fiveButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        _fourButton.layer.borderColor = MainColor.CGColor;
        _niceButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _sevenButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _fiveButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
    }
}
@end
