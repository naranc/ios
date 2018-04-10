//
//  AddAdressTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AddAdressTableViewCell.h"

@implementation AddAdressTableViewCell

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
    if ([super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.inputLabel];
        [self addSubview:self.inputTF];
        [self addSubview:self.inputLineView];
    }
    return self;
}
- (UILabel *)inputLabel
{
    if (!_inputLabel) {
        _inputLabel = [[UILabel alloc] init];
        _inputLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _inputLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _inputLabel;
}
- (UITextField *)inputTF
{
    if (!_inputTF) {
        _inputTF = [[UITextField alloc] init];
        _inputTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _inputTF.textColor = kUIColorFromRGB(0x999999);
    }
    return _inputTF;
}
- (UIImageView *)inputLineView
{
    if (!_inputLineView) {
        _inputLineView = [[UIImageView alloc] init];
        _inputLineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _inputLineView;
}
- (void)layoutSubviews
{
    _inputLabel.frame = CGRectMake(15, 12, 65, 22);
    
    _inputTF.frame = CGRectMake(_inputLabel.right + 30, 14, SCREEN_WIDTH - 30 - 65 - 30, 20);

    _inputLineView.frame = CGRectMake(0, 45, SCREEN_WIDTH, 1);
}
@end
