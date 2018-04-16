//
//  TopTbTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TopTbTableViewCell.h"

@implementation TopTbTableViewCell

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
        [self addSubview:self.nameLabel];
        [self addSubview:self.contentLabel];
    }
    return self;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(15, 12, SCREEN_WIDTH - 30, 20);
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        _nameLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _nameLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = CGRectMake(15, _nameLabel.bottom + 12, SCREEN_WIDTH - 30, 20);
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _contentLabel;
}

- (void)setCommentContent:(NSString *)model indexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [[GlobalSingleton Singleton] getHeigthWithText:model width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height;
    _contentLabel.frame = CGRectMake(15, _nameLabel.bottom + 12, SCREEN_WIDTH - 30, height);
    _contentLabel.text = model;
}

@end
