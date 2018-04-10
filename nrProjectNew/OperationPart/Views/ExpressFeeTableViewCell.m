//
//  ExpressFeeTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "ExpressFeeTableViewCell.h"

@interface ExpressFeeTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * feeLabel;

@property (nonatomic, strong) UILabel * introduceLabel;

@end

@implementation ExpressFeeTableViewCell

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
        [_bgView addSubview:self.feeLabel];
        [self addSubview:self.introduceLabel];
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

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = nameFont;
        _titleLabel.text = @"预估重量";
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}
- (UILabel *)feeLabel
{
    if (!_feeLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _feeLabel = [[UILabel alloc] init];
        _feeLabel.text = @"约20元";
        _feeLabel.font = nameFont;
        _feeLabel.textAlignment = NSTextAlignmentRight;
        _feeLabel.textColor = MainColor;
    }
    return _feeLabel;
}

- (UILabel *)introduceLabel
{
    if (!_introduceLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:12];
        _introduceLabel = [[UILabel alloc] init];
        _introduceLabel.font = nameFont;
        _introduceLabel.numberOfLines = 0;
        _introduceLabel.text = @"快递费怎么算？\n1公斤内12元，每增加1公斤加收8元，平台不收取任何快递佣金。\n这里写一些我们的快递协议，什么的";
        _introduceLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _introduceLabel;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat wight = (SCREEN_WIDTH - 30) / 2 - 30;
    
    _bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 45);
    
    _titleLabel.frame = CGRectMake(15, 12, wight, 21);
    
    _feeLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - wight, 12, wight, 21);
    
    _introduceLabel.frame = CGRectMake(15, _bgView.bottom + 4, SCREEN_WIDTH - 30, 51);
}
@end
