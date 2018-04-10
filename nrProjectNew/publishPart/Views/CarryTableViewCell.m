//
//  CarryTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/25.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "CarryTableViewCell.h"


@interface CarryTableViewCell ()

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) ImageTextButton * doButton;

@property (nonatomic, strong) ImageTextButton * dontButton;

@end

@implementation CarryTableViewCell

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
        [self addSubview:self.titleLabel];
        [self addSubview:self.doButton];
        [self addSubview:self.dontButton];
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"是否愿意承担运费？";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}
- (ImageTextButton *)doButton
{
    if (!_doButton) {
        _doButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _doButton.midSpacing = 4;
        _doButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _doButton.imageSize = CGSizeMake(12, 12);
        [_doButton setTitle:@"我愿意" forState:UIControlStateNormal];
        [_doButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _doButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_doButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
        _doButton.tag = 1001;
        [_doButton addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doButton;
}
- (ImageTextButton *)dontButton
{
    if (!_dontButton) {
        _dontButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _dontButton.midSpacing = 4;
        _dontButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _dontButton.imageSize = CGSizeMake(12, 12);
        [_dontButton setTitle:@"我不愿意" forState:UIControlStateNormal];
        [_dontButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _dontButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_dontButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
        _dontButton.tag = 1002;
        [_dontButton addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dontButton;
}
- (void)layoutSubviews
{
    _titleLabel.frame = CGRectMake(15, 16, 140, 21);
    
    _doButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 12 - 4 - 59 - 20 - 12 - 4 - 44, 16, 12 + 4 + 44, 21);
    
    _dontButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 12 - 4 - 59, 16, 12 + 4 + 59, 21);

}
- (void)publishWishButton:(UIButton *)btn
{
    if (btn.tag == 1001) {
        [_doButton setImage:[UIImage imageNamed:@"zan_green_s"] forState:UIControlStateNormal];
        [_dontButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
    }else{
        [_doButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
        [_dontButton setImage:[UIImage imageNamed:@"zan_green_s"] forState:UIControlStateNormal];
    }
}
@end
