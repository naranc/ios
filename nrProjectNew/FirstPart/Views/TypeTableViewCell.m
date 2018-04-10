//
//  TypeTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/9.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TypeTableViewCell.h"

@implementation TypeTableViewCell

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
        
        self.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview:self.typeLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    _typeImageView.frame = CGRectMake(15, 0, 83, 75);
    _typeLabel.frame = CGRectMake(15, _typeImageView.bottom + 3, 83, 17);
}
- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _typeLabel.text = @"美妆护理";
        _typeLabel.textColor = kUIColorFromRGB(0x666666);
        _typeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _typeLabel;
}
- (UIImageView *)bgImageView
{
    if (!_typeImageView) {
        _typeImageView = [[UIImageView alloc] init];
        _typeImageView.layer.cornerRadius = 4.0f;
        _typeImageView.clipsToBounds = YES;
        _typeImageView.contentMode = UIViewContentModeScaleAspectFill;
        _typeImageView.clipsToBounds = YES;
        _typeImageView.image = [UIImage imageNamed:@"gongjuqicai"];
    }
    return _typeImageView;
}
@end
