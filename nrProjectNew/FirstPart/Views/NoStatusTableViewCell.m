//
//  NoStatusTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "NoStatusTableViewCell.h"

@implementation NoStatusTableViewCell

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
        self.backgroundColor = kUIColorFromRGB(0xffffff);
        [self addSubview:self.noBooksImage];
        [self addSubview:self.noBooksLabel];
    }
    return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier noBookHelp:(BOOL)noBook
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.helpBooksImage];
        [_bgView addSubview:self.helpBooksLabel];
        [_bgView addSubview:self.helpBookContentsLabel];
    }
    return self;
}
- (UIImageView *)noBooksImage
{
    if (!_noBooksImage) {
        _noBooksImage = [[UIImageView alloc] init];
        _noBooksImage.frame = CGRectMake((SCREEN_WIDTH - 52)/2, 24, 52, 52);
        _noBooksImage.image = [UIImage imageNamed:@"sousuowujieguo"];
    }
    return _noBooksImage;
}
- (UILabel *)noBooksLabel
{
    if (!_noBooksLabel) {
        _noBooksLabel = [[UILabel alloc] init];
        _noBooksLabel.frame = CGRectMake(15, _noBooksImage.bottom + 15, SCREEN_WIDTH - 30, 20);
        _noBooksLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _noBooksLabel.text = @"什么都没有哦";
        _noBooksLabel.textAlignment = NSTextAlignmentCenter;
        _noBooksLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _noBooksLabel;
}



- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 8, SCREEN_WIDTH, 98);
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UIImageView *)helpBooksImage
{
    if (!_helpBooksImage) {
        _helpBooksImage = [[UIImageView alloc] init];
        _helpBooksImage.frame = CGRectMake(9, 24, 78, 78);
        _helpBooksImage.image = [UIImage imageNamed:@"icon_shuhuanghuzhu"];
    }
    return _helpBooksImage;
}
- (UILabel *)helpBooksLabel
{
    if (!_helpBooksLabel) {
        _helpBooksLabel = [[UILabel alloc] init];
        _helpBooksLabel.frame = CGRectMake(_helpBooksImage.right + 1, 27, 60, 20);
        _helpBooksLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _helpBooksLabel.text = @"书荒互助";
        _helpBooksLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _helpBooksLabel;
}
- (UILabel *)helpBookContentsLabel
{
    if (!_helpBookContentsLabel) {
        _helpBookContentsLabel = [[UILabel alloc] init];
        _helpBookContentsLabel.frame = CGRectMake(_helpBooksImage.right + 1, _helpBooksLabel.bottom + 8, SCREEN_WIDTH - 19 - 78, 17);
        _helpBookContentsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _helpBookContentsLabel.text = @"快去书荒互助去发布吧，让小伙伴帮助你找到它";
        _helpBookContentsLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _helpBookContentsLabel;
}
@end
