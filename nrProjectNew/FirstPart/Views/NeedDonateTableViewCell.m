//
//  NeedDonateTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/17.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "NeedDonateTableViewCell.h"

@interface NeedDonateTableViewCell ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * userImageview;

@property (nonatomic, strong) UILabel * contentLabel;


@end

@implementation NeedDonateTableViewCell

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
        [self addSubview:self.bgView];
        [_bgView addSubview:self.userImageview];
        [_bgView addSubview:self.contentLabel];
    }
    return self;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _bgView.layer.cornerRadius = 4.0f;
        _bgView.layer.shadowColor = kUIColorFromRGBWithAlpha(0x000000, 0.15).CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0, 0);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 1;

    }
    return _bgView;
}
- (UIImageView *)userImageview
{
    if (!_userImageview) {
        _userImageview = [[UIImageView alloc] init];
        _userImageview.clipsToBounds = YES;
        _userImageview.layer.cornerRadius = 20;
        _userImageview.contentMode = UIViewContentModeScaleAspectFill;
        _userImageview.image = [UIImage imageNamed:@"xhdpibanner.png"];
    }
    return _userImageview;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = nameFont;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _contentLabel;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bgView.frame = CGRectMake(13, 8, SCREEN_WIDTH - 26, 79);
    
    _userImageview.frame = CGRectMake(15, 20, 40, 40);
    
    _contentLabel.frame = CGRectMake(_userImageview.right + 10, 20, _bgView.width - 30 - 50, 40);

}

- (void)donateDetailViewConfigCellWithModel:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath
{
    _contentLabel.text = model[@"applyTitle"];
    
    [_userImageview sd_setImageWithURL:[NSURL URLWithString:model[@"accountImg"]] placeholderImage:nil];
}

@end
