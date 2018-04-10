//
//  PriceTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "PriceTableViewCell.h"

@interface PriceTableViewCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * priceL;

@end

@implementation PriceTableViewCell

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
        [_bgView addSubview:self.dimButton];
        [_bgView addSubview:self.forgetButton];

    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 81);
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 12, 110, 21);
        _titleLabel.text = @"捐赠物品的价格";
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
        _priceTF.frame = CGRectMake(15, _titleLabel.bottom + 11, 68, 24);
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
        _priceTF.delegate = self;
        _priceTF.layer.borderWidth = 0.5;
        _priceTF.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _priceTF.tintColor = kUIColorFromRGB(0x666666);
    }
    return _priceTF;
}
- (UILabel *)priceL
{
    if (!_priceL) {
        _priceL = [[UILabel alloc] init];
        _priceL.frame = CGRectMake(_priceTF.right + 4, _titleLabel.bottom + 12, 18, 21);
        _priceL.text = @"元";
        _priceL.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _priceL.textColor = kUIColorFromRGB(0x666666);
    }
    return _priceL;
}
- (UIButton *)dimButton
{
    if (!_dimButton) {
        _dimButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _dimButton.frame = CGRectMake(_priceL.right + 24, _titleLabel.bottom + 12, 68, 24);
        [_dimButton setTitle:@"不清楚" forState:UIControlStateNormal];
        _dimButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _dimButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_dimButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _dimButton.layer.borderWidth = 0.5f;
        _dimButton.layer.cornerRadius = 24/2;
        _dimButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _dimButton.clipsToBounds = YES;
        _dimButton.tag = 1001;
        [_dimButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dimButton;
}

- (UIButton *)forgetButton
{
    if (!_forgetButton) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _forgetButton.frame = CGRectMake(_dimButton.right + 24, _titleLabel.bottom + 12, 68, 24);
        [_forgetButton setTitle:@"忘记了" forState:UIControlStateNormal];
        _forgetButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _forgetButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_forgetButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _forgetButton.layer.borderWidth = 0.5f;
        _forgetButton.layer.cornerRadius = 24/2;
        _forgetButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _forgetButton.clipsToBounds = YES;
        _forgetButton.tag = 1002;
        [_forgetButton addTarget:self action:@selector(clickYesOrNoSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetButton;
}
- (void)clickYesOrNoSelect:(UIButton *)btn
{
    if (btn.tag == 1001) {
        
        _dimButton.backgroundColor = MainColor;
        _forgetButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        [_dimButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_forgetButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        _dimButton.layer.borderColor = MainColor.CGColor;
        _forgetButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        
    }
    if (btn.tag == 1002){
        
        _forgetButton.backgroundColor = MainColor;
        _dimButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        
        [_forgetButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_dimButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        
        _forgetButton.layer.borderColor = MainColor.CGColor;
        _dimButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
