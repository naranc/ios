//
//  HomeTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

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
        
        [_bgView addSubview:self.bookImageView];
        
        [_bgView addSubview:self.nameLabel];
        
        [_bgView addSubview:self.authorLabel];
        
        [_bgView addSubview:self.introLabel];
        
        [_bgView addSubview:self.locationBtn];

    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
        _bgView.layer.cornerRadius = 4.0f;
        [_bgView.layer masksToBounds];
        _bgView.layer.shadowColor = kUIColorFromRGBWithAlpha(0x000000, 0.15).CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0, 0);
        _bgView.layer.shadowOpacity = 5;
        _bgView.layer.shadowRadius = 5;
    }
    return _bgView;
}
- (UIImageView *)bookImageView
{
    if (!_bookImageView) {
        _bookImageView = [[UIImageView alloc] init];
        _bookImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bookImageView.clipsToBounds = YES;
    }
    return _bookImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _nameLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _nameLabel;
}
- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _authorLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _authorLabel;
}

- (UILabel *)introLabel
{
    if (!_introLabel) {
        _introLabel = [[UILabel alloc] init];
        _introLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _introLabel.textColor = kUIColorFromRGB(0x999999);
        _introLabel.numberOfLines = 0;
    }
    return _introLabel;
}

- (ImageTextButton *)locationBtn
{
    if (!_locationBtn) {
        _locationBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _locationBtn.midSpacing = 5;
        _locationBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _locationBtn.imageSize = CGSizeMake(11.9, 13.8);
        [_locationBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _locationBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_locationBtn setImage:[UIImage imageNamed:@"list_icon_weizhi"] forState:UIControlStateNormal];
       
    }
    return _locationBtn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bgView.frame = CGRectMake(15, 16, SCREEN_WIDTH - 30, 144);
    
    _bookImageView.frame = CGRectMake(12, 12, 80, 120);
    
    _nameLabel.frame = CGRectMake(_bookImageView.right + 12, 12, 100, 24);
    
    _authorLabel.frame = CGRectMake(_bookImageView.right + 12, _nameLabel.bottom + 8, 100, 17);

    _introLabel.frame = CGRectMake(_bookImageView.right + 12, _authorLabel.bottom + 8, SCREEN_WIDTH - 30 - 104 - 14, 34);

    _locationBtn.frame = CGRectMake(_bookImageView.right + 13.1, _introLabel.bottom + 13, 50, 16);
}
- (void)bookDetailViewConfigCellWithModel:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath
{
    _bookImageView.image = [UIImage imageNamed:@"bitmap"];

    _nameLabel.text = @"红楼梦";
    
    _authorLabel.text = @"曹雪芹";
    
    _introLabel.text = @"《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说…";

    [_locationBtn setTitle:@"33.3km" forState:UIControlStateNormal];

}

@end
