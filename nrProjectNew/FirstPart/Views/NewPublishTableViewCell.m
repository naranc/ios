//
//  NewPublishTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "NewPublishTableViewCell.h"

@interface NewPublishTableViewCell ()

@property (strong, nonatomic) UIView * bgView;

@property (strong, nonatomic) UILabel * titleLabel;

@end

@implementation NewPublishTableViewCell

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
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.titleLabel];
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
        UIFont * titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = titleFont;
        _titleLabel.text = @"最新发布";
        _titleLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _titleLabel;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bgView.frame = CGRectMake(0, 8, SCREEN_WIDTH, 41);
    
    _titleLabel.frame = CGRectMake(15, 12, 200, 17);

    
}
@end
