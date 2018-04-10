//
//  HelpSAdressTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "HelpSAdressTableViewCell.h"

@interface HelpSAdressTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * lineView;

@property (nonatomic, strong) UILabel * leftTitleLabel;

@property (nonatomic, strong) UILabel * rightTitleLabel;

@end

@implementation HelpSAdressTableViewCell

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
        [_bgView addSubview:self.lineView];
        [_bgView addSubview:self.leftTitleLabel];
        [_bgView addSubview:self.leftContentLabel];
        [_bgView addSubview:self.rightTitleLabel];
        [_bgView addSubview:self.rightContentLabel];
    }
    return self;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xBBBBBB);
    }
    return _lineView;
}
- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _leftTitleLabel = [[UILabel alloc] init];
        _leftTitleLabel.font = nameFont;
        _leftTitleLabel.text = @"我的地址";
        _leftTitleLabel.textAlignment = NSTextAlignmentCenter;
        _leftTitleLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _leftTitleLabel;
}
- (UILabel *)rightTitleLabel
{
    if (!_rightTitleLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _rightTitleLabel = [[UILabel alloc] init];
        _rightTitleLabel.text = @"他的地址";
        _rightTitleLabel.font = nameFont;
        _rightTitleLabel.textAlignment = NSTextAlignmentCenter;
        _rightTitleLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _rightTitleLabel;
}

- (UILabel *)leftContentLabel
{
    if (!_leftContentLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _leftContentLabel = [[UILabel alloc] init];
        _leftContentLabel.font = nameFont;
        _leftContentLabel.textAlignment = NSTextAlignmentCenter;
        _leftContentLabel.text = @"浙江省杭州市";
        _leftContentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _leftContentLabel;
}
- (UILabel *)rightContentLabel
{
    if (!_rightContentLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _rightContentLabel = [[UILabel alloc] init];
        _rightContentLabel.font = nameFont;
        _rightContentLabel.textAlignment = NSTextAlignmentCenter;
        _rightContentLabel.text = @"浙江省杭州市";
        _rightContentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _rightContentLabel;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat wight = (SCREEN_WIDTH - 0.5)/2 - 30;
    
    _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 113);
    
    _lineView.frame = CGRectMake((SCREEN_WIDTH - 0.5) / 2, 20, 0.5, 113 - 40);
    
    _leftTitleLabel.frame = CGRectMake(15, 30, wight, 17);
    
    _leftContentLabel.frame = CGRectMake(15, _leftTitleLabel.bottom + 8, wight, 21);
    
    _rightTitleLabel.frame = CGRectMake(_lineView.right + 15, 30, wight, 17);
    
    _rightContentLabel.frame = CGRectMake(_lineView.right + 15, _rightTitleLabel.bottom + 8, wight, 21);

}
@end
