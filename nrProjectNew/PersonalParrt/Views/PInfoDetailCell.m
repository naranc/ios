//
//  PInfoDetailCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PInfoDetailCell.h"

@implementation PInfoDetailCell

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
        [self addSubview:self.contentLabel];
        [self addSubview:self.fowordImageView];
        [self addSubview:self.lineImageView];
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.textAlignment = NSTextAlignmentRight;
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
//        _contentLabel.backgroundColor = [UIColor redColor];
    }
    return _contentLabel;
}
- (UIImageView *)fowordImageView
{
    if (!_fowordImageView) {
        _fowordImageView = [[UIImageView alloc] init];
        _fowordImageView.image = [UIImage imageNamed:@"list_icon_xiangqing"];
    }
    return _fowordImageView;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineImageView;
}
- (void)layoutSubviews
{
    CGFloat wight = SCREEN_WIDTH - 30 - 80 - 6.4 - 13 - 10;
    
    _titleLabel.frame = CGRectMake(15, 12, 80, 22);
    
    _fowordImageView.frame = CGRectMake(SCREEN_WIDTH - 15 - 6.4, 15.9, 6.4, 14.1);
    
    _contentLabel.frame = CGRectMake(_fowordImageView.left - 13 - wight, 13, wight, 20);

    _lineImageView.frame = CGRectMake(0, 45, SCREEN_WIDTH, 1.0f);
}
@end
