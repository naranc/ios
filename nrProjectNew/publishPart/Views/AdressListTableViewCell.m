//
//  AdressListTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AdressListTableViewCell.h"
#import "AdressModel.h"
#define labelFont [UIFont fontWithName:@"PingFangSC-Light" size:15]

@interface AdressListTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * phoneLabel;

@property (nonatomic, strong) UILabel * adressLabel;

@property (nonatomic, strong) ImageTextButton * selectBtn;

@property (nonatomic, strong) UIButton * editBtn;

@property (nonatomic, strong) UIButton * deleteBtn;

@property (nonatomic, strong) UIImageView * lineImageView;

@property (nonatomic, strong) UIImageView * locationImageView;

@end

@implementation AdressListTableViewCell

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
        [_bgView addSubview:self.nameLabel];
        [_bgView addSubview:self.phoneLabel];
        [_bgView addSubview:self.locationImageView];
        [_bgView addSubview:self.adressLabel];
        [_bgView addSubview:self.lineImageView];
        [_bgView addSubview:self.selectBtn];
        [_bgView addSubview:self.editBtn];
        [_bgView addSubview:self.deleteBtn];
    }
    return self;
}
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
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineImageView;
}
- (UIImageView *)locationImageView
{
    if (!_locationImageView) {
        _locationImageView = [[UIImageView alloc] init];
        _locationImageView.frame = CGRectMake(15, _nameLabel.bottom + 15.1, 12.8, 15.8);
        _locationImageView.image = [UIImage imageNamed:@"list_icon_dizhi"];
    }
    return _locationImageView;
}
- (UILabel *)adressLabel
{
    if (!_adressLabel) {
        _adressLabel = [[UILabel alloc] init];
//        _adressLabel.frame = CGRectMake(_nameLabel.right, 15, (SCREEN_WIDTH - 30) / 2, 21);
        _adressLabel.font = labelFont;
        _adressLabel.numberOfLines = 0;
        _adressLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _adressLabel;
}
- (ImageTextButton *)selectBtn
{
    if (!_selectBtn) {
        _selectBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.midSpacing = 6;
        _selectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
        _selectBtn.imageSize = CGSizeMake(20, 20);
        [_selectBtn setTitle:@"默认地址" forState:UIControlStateNormal];
        [_selectBtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _selectBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_selectBtn setImage:[UIImage imageNamed:@"list_gou_pre"] forState:UIControlStateNormal];
        [_selectBtn addTarget:self action:@selector(selectNowAdressButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}
- (void)selectNowAdressButton
{
    if (self.onClickSelectAdressButton) {
        self.onClickSelectAdressButton();
    }
}
- (UIButton *)editBtn
{
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _editBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
        [_editBtn addTarget:self action:@selector(clickEidtButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}
- (void)clickEidtButton:(UIButton *)btn
{
    if (self.onClickEidtButton) {
        self.onClickEidtButton();
    }
}
- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _deleteBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
        [_deleteBtn addTarget:self action:@selector(clickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}
- (void)clickDeleteButton:(UIButton *)btn
{
    if (self.onClickDeleteButton) {
        self.onClickDeleteButton();
    }
}
- (void)configCellWithModel:(AdressModel *)model indexPath:(NSIndexPath *)indexPath;
{
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:[NSString stringWithFormat:@"    %@%@%@%@",model.province,model.city,model.county,model.mailAddress] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
    
    _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 48 * 2 + rect.size.height);
    
    _adressLabel.frame = CGRectMake(15, _nameLabel.bottom + 12, SCREEN_WIDTH - 30, rect.size.height);
    
    _lineImageView.frame = CGRectMake(14, _adressLabel.bottom + 9, SCREEN_WIDTH - 28, 0.5);
    
    _selectBtn.frame = CGRectMake(25, _lineImageView.bottom + 6.5, 50, 20);
    
    _editBtn.frame = CGRectMake(SCREEN_WIDTH - 21 - 24 - 29 - 24, _lineImageView.bottom + 9.5, 24, 17);
    
    _deleteBtn.frame = CGRectMake(SCREEN_WIDTH - 21 - 24, _lineImageView.bottom + 9.5, 24, 17);
    
    _adressLabel.text = [NSString stringWithFormat:@"    %@%@%@%@",model.province,model.city,model.county,model.mailAddress];
    
    _nameLabel.text = [NSString stringWithFormat:@"收货人：%@",model.mailName];

    _phoneLabel.text = model.mailPhone;
    
    if (model.nowMail) {
        [_selectBtn setTitle:@"默认地址" forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"list_gou_pre"] forState:UIControlStateNormal];
    }else{
        [_selectBtn setTitle:@"设为默认" forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"list_gou"] forState:UIControlStateNormal];
    }
    
}


@end
