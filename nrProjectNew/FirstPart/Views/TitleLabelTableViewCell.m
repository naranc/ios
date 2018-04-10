//
//  TitleLabelTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/2/1.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TitleLabelTableViewCell.h"

@interface TitleLabelTableViewCell ()


@end

@implementation TitleLabelTableViewCell

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
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(9, 11, 40, 17);
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
@end
