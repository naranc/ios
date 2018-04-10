//
//  SelectAdressTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/6.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SelectAdressTableViewCell.h"
#import "AdressModel.h"
#define labelFont [UIFont fontWithName:@"PingFangSC-Light" size:15]

@interface SelectAdressTableViewCell ()

//没有选择地址的cell
@property (nonatomic, strong) UIView * nullAdressBgView;

@property (nonatomic, strong) ImageTextButton * nullAdressBtn;

@property (nonatomic, strong) UIImageView * nforwordImageView;



//选择完地址的cell
@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * phoneLabel;

@property (nonatomic, strong) UILabel * adressLabel;

@property (nonatomic, strong) UIImageView * locationImageView;//地址图标

@property (nonatomic, strong) UIImageView * forwordImageView;

@end


@implementation SelectAdressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithNullAdressStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.nullAdressBgView];
        [_nullAdressBgView addSubview:self.nullAdressBtn];
        [_nullAdressBgView addSubview:self.nforwordImageView];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.nameLabel];
        [_bgView addSubview:self.phoneLabel];
        [_bgView addSubview:self.locationImageView];
        [_bgView addSubview:self.adressLabel];
        [_bgView addSubview:self.forwordImageView];
    }
    return self;
}

//位选择地址的布局
- (UIView *)nullAdressBgView
{
    if (!_nullAdressBgView) {
        _nullAdressBgView = [[UIView alloc] init];
        _nullAdressBgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 46);
        _nullAdressBgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _nullAdressBgView.userInteractionEnabled = YES;
    }
    return _nullAdressBgView;
}

- (ImageTextButton *)nullAdressBtn
{
    if (!_nullAdressBtn) {
        _nullAdressBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _nullAdressBtn.frame = CGRectMake(15, 13, SCREEN_WIDTH - 90, 21);
        _nullAdressBtn.midSpacing = 5;
        _nullAdressBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _nullAdressBtn.imageSize = CGSizeMake(12.8, 15.8);
        [_nullAdressBtn setTitle:@"请填写您的收货地址" forState:UIControlStateNormal];
        [_nullAdressBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _nullAdressBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_nullAdressBtn setImage:[UIImage imageNamed:@"list_dizhi"] forState:UIControlStateNormal];
        _nullAdressBtn.enabled = NO;
    }
    return _nullAdressBtn;
}
- (UIImageView *)nforwordImageView
{
    if (!_nforwordImageView) {
        _nforwordImageView = [[UIImageView alloc] init];
        _nforwordImageView.frame = CGRectMake(SCREEN_WIDTH - 14.5 - 9.5, 13.5, 9.5, 18.5);
        _nforwordImageView.image = [UIImage imageNamed:@"icon_xiangqing"];
    }
    return _nforwordImageView;
}




//选择完地址的布局
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(15, 15, (SCREEN_WIDTH - 30) / 2, 21);
        _nameLabel.font = labelFont;
        _nameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _nameLabel;
}
- (UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.frame = CGRectMake(_nameLabel.right, 15, (SCREEN_WIDTH - 30) / 2, 21);
        _phoneLabel.font = labelFont;
        _phoneLabel.textAlignment = NSTextAlignmentRight;
        _phoneLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _phoneLabel;
}

- (UIImageView *)locationImageView
{
    if (!_locationImageView) {
        _locationImageView = [[UIImageView alloc] init];
        _locationImageView.frame = CGRectMake(15, _nameLabel.bottom + 18, 15, 18);
        _locationImageView.image = [UIImage imageNamed:@"list_icon_dizhi"];
    }
    return _locationImageView;
}
- (UILabel *)adressLabel
{
    if (!_adressLabel) {
        _adressLabel = [[UILabel alloc] init];
        _adressLabel.font = labelFont;
        _adressLabel.numberOfLines = 0;
        _adressLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _adressLabel;
}
- (UIImageView *)forwordImageView
{
    if (!_forwordImageView) {
        _forwordImageView = [[UIImageView alloc] init];
        _forwordImageView.image = [UIImage imageNamed:@"icon_xiangqing"];
    }
    return _forwordImageView;
}
- (void)configCellWithModel:(AdressModel *)model indexPath:(NSIndexPath *)indexPath
{
    NSString * adressString = [NSString stringWithFormat:@"    %@%@%@%@",model.province,model.city,model.county,model.mailAddress];

    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:adressString width:SCREEN_WIDTH - 15 - 74 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];

    _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 52 + rect.size.height + 15);
    
    _adressLabel.frame = CGRectMake(15, _nameLabel.bottom + 16, SCREEN_WIDTH - 15 - 74, rect.size.height);
    
    _forwordImageView.frame = CGRectMake(SCREEN_WIDTH - 14.5 - 9.5, 52 + (rect.size.height - 18.5) / 2, 9.5, 18.5);

    _adressLabel.text = adressString;
    
    _nameLabel.text = [NSString stringWithFormat:@"收货人：%@",model.mailName];
    
    _phoneLabel.text = model.mailPhone;
    
}

@end
