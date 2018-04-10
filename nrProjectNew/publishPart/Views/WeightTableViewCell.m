//
//  WeightTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "WeightTableViewCell.h"


@interface WeightTableViewCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * priceL;

@end

@implementation WeightTableViewCell

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
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.priceTF];
        [_bgView addSubview:self.priceL];
    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 45);
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 12, 70, 21);
        _titleLabel.text = @"预估重量";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}

- (UITextField *)priceTF
{
    if (!_priceTF) {
        UIFont * tfFont = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _priceTF = [[UITextField alloc] init];
        _priceTF.frame = CGRectMake(SCREEN_WIDTH - 35 - 68, 11, 68, 24);
        _priceTF.font = tfFont;
        _priceTF.returnKeyType = UIReturnKeyDone;
        _priceTF.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _priceTF.textColor = kUIColorFromRGB(0x666666);
        _priceTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 13, 0)];
        _priceTF.leftViewMode = UITextFieldViewModeAlways;
        _priceTF.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 13, 0)];
        _priceTF.rightViewMode = UITextFieldViewModeAlways;
        _priceTF.layer.cornerRadius = 12;
        _priceTF.clipsToBounds = YES;
        _priceTF.layer.borderWidth = 0.5;
        _priceTF.delegate = self;
//        _priceTF.keyboardType = UIKeyboardTypeNumberPad;
        _priceTF.textAlignment = NSTextAlignmentCenter;
        _priceTF.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _priceTF.tintColor = kUIColorFromRGB(0x666666);
    }
    return _priceTF;
}
- (UILabel *)priceL
{
    if (!_priceL) {
        _priceL = [[UILabel alloc] init];
        _priceL.frame = CGRectMake(SCREEN_WIDTH - 15 - 16, 11, 18, 21);
        _priceL.text = @"kg";
        _priceL.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _priceL.textColor = kUIColorFromRGB(0x666666);
    }
    return _priceL;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
