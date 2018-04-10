//
//  SelectFreightTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/6.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SelectFreightTableViewCell.h"

@interface SelectFreightTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation SelectFreightTableViewCell

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
        _yesSelect = YES;
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.yesButton];
        [_bgView addSubview:self.noButton];
    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 85);
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
        _titleLabel.text = @"是否能承担运费？";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}

- (UIButton *)yesButton
{
    if (!_yesButton) {
        _yesButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _yesButton.frame = CGRectMake(15, _titleLabel.bottom + 11, 39, 24);
        [_yesButton setTitle:@"是" forState:UIControlStateNormal];
        _yesButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _yesButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _yesButton.backgroundColor = MainColor;
        [_yesButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _yesButton.layer.borderWidth = 0.5f;
        _yesButton.layer.cornerRadius = 24/2;
        _yesButton.layer.borderColor = MainColor.CGColor;
        _yesButton.clipsToBounds = YES;
        _yesButton.tag = 1001;
        [_yesButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesButton;
}

- (UIButton *)noButton
{
    if (!_noButton) {
        _noButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _noButton.frame = CGRectMake(_yesButton.right + 24, _titleLabel.bottom + 11, 39, 24);
        [_noButton setTitle:@"否" forState:UIControlStateNormal];
        _noButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _noButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_noButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _noButton.layer.borderWidth = 0.5f;
        _noButton.layer.cornerRadius = 24/2;
        _noButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _noButton.clipsToBounds = YES;
        _noButton.tag = 1002;
        _noButton.selected = NO;
        [_noButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _noButton;
}
- (void)clickYesOrNoSelect:(UIButton *)btn
{
    if (btn.tag == 1001) {
        _yesSelect = YES;
        _yesButton.backgroundColor = MainColor;
        _noButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        [_yesButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_noButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        
        _yesButton.layer.borderColor = MainColor.CGColor;
        _noButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        
    }
    if (btn.tag == 1002){
        _yesSelect = NO;
        _noButton.backgroundColor = MainColor;
        _yesButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        

        [_noButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_yesButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        
        _noButton.layer.borderColor = MainColor.CGColor;
        _yesButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        
    }
}
@end
