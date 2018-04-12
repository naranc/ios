//
//  HotBorrowTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "HotBorrowTableViewCell.h"
#import "BorrowView.h"

@interface HotBorrowTableViewCell ()
{
    CGFloat space;
}
@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation HotBorrowTableViewCell

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
        space = (SCREEN_WIDTH - 62 - 240) / 2;
        self.backgroundColor = kUIColorFromRGB(0xF5F5F5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.lBorrowView];
        [_bgView addSubview:self.cBorrowView];
        [_bgView addSubview:self.rBorrowView];
    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 8, SCREEN_WIDTH, 210);
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 12, 60, 17);
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _titleLabel.text = @"借阅热榜单";
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
- (BorrowView *)lBorrowView
{
    if (!_lBorrowView) {
        _lBorrowView = [[BorrowView alloc] initWithFrame:CGRectMake(31, 47, 80, 145)];
    }
    return _lBorrowView;
}
- (BorrowView *)cBorrowView
{
    if (!_cBorrowView) {
        _cBorrowView = [[BorrowView alloc] initWithFrame:CGRectMake(_lBorrowView.right + space, 47, 80, 145)];
    }
    return _cBorrowView;
}
- (BorrowView *)rBorrowView
{
    if (!_rBorrowView) {
        _rBorrowView = [[BorrowView alloc] initWithFrame:CGRectMake(_cBorrowView.right + space, 47, 80, 145)];
    }
    return _rBorrowView;
}
@end
