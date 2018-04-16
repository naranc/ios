//
//  BookCommunityTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookCommunityTableViewCell.h"


@interface BookCommunityTableViewCell ()

@property (strong, nonatomic) UIImageView * userImageView;

@property (strong, nonatomic) UILabel * nameLabel;

@property (strong, nonatomic) UILabel * timeLabel;

@property (strong, nonatomic) UILabel * contentLabel;

@property (strong, nonatomic) UIImageView * picImageView;

@property (strong, nonatomic) ImageTextButton * zanButton;

@property (strong, nonatomic) ImageTextButton * commentButton;

@end

@implementation BookCommunityTableViewCell

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
        
        self.userImageView.frame = CGRectMake(15, 16, 30, 30);
        [self addSubview:_userImageView];
    
        self.nameLabel.frame = CGRectMake(_userImageView.right + 8, 21, SCREEN_WIDTH / 2, 20);
        [self addSubview:_nameLabel];
        
        self.timeLabel.frame = CGRectMake(SCREEN_WIDTH - 87, 23, 72, 17);
        [self addSubview:_timeLabel];
        
        self.contentLabel.frame = CGRectZero;
        [self addSubview:_contentLabel];
        
        self.picImageView.frame = CGRectZero;
        [self addSubview:_picImageView];
        
        self.zanButton.frame = CGRectMake(15, 137, 50, 16);
        [self addSubview:_zanButton];
        
        self.commentButton.frame = CGRectMake(75, 137, 50, 16);
        [self addSubview:_commentButton];
        
    }
    return self;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.layer.cornerRadius = 30/2;
        _userImageView.clipsToBounds = YES;
    }
    return _userImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = kUIColorFromRGB(0x999999);
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    }
    return _nameLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _timeLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = kUIColorFromRGB(0x000000);
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.contentMode = UIViewContentModeScaleAspectFill;
        _picImageView.clipsToBounds = YES;
    }
    return _picImageView;
}
- (ImageTextButton *)zanButton
{
    if (!_zanButton) {
        _zanButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _zanButton.frame = CGRectMake(SCREEN_WIDTH - 25 - 40, 26, 40, 17);
        _zanButton.midSpacing = 2;
        _zanButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _zanButton.imageSize = CGSizeMake(12, 12);
        [_zanButton setTitle:@"18" forState:UIControlStateNormal];
        [_zanButton setTitleColor:kUIColorFromRGB(0xFF739A) forState:UIControlStateNormal];
        _zanButton.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_zanButton setImage:[UIImage imageNamed:@"list_btn_zan_s_gre2"] forState:UIControlStateNormal];
        
    }
    return _zanButton;
}
- (ImageTextButton *)commentButton
{
    if (!_commentButton) {
        _commentButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentButton.frame = CGRectMake(SCREEN_WIDTH - 25 - 40, 26, 40, 17);
        _commentButton.midSpacing = 2;
        _commentButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commentButton.imageSize = CGSizeMake(12, 12);
        [_commentButton setTitle:@"18" forState:UIControlStateNormal];
        [_commentButton setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _commentButton.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_commentButton setImage:[UIImage imageNamed:@"list_btn_pinglun3"] forState:UIControlStateNormal];
        
    }
    return _commentButton;
}
- (void)configCellWithModel:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath
{
    
    if (dic[@"picImage"]) {
        _picImageView.frame = CGRectMake(SCREEN_WIDTH - 15 - 100, 53, 100, 100);
        _contentLabel.frame = CGRectMake(15, _userImageView.bottom + 7, SCREEN_WIDTH - 130 - 14, 46);
    }else{
        _picImageView.frame = CGRectZero;
        _contentLabel.frame = CGRectMake(15, _userImageView.bottom + 7, SCREEN_WIDTH - 30, 46);
    }
    _userImageView.image = [UIImage imageNamed:@"userimagePic.jpg"];
    _nameLabel.text = dic[@"name"];
    _timeLabel.text = dic[@"time"];
    _contentLabel.text = dic[@"content"];
    _picImageView.image = [UIImage imageNamed:dic[@"picImage"]];
    [_zanButton setTitle:[NSString stringWithFormat:@"%@",dic[@"zanCount"]] forState:UIControlStateNormal];
    [_commentButton setTitle:[NSString stringWithFormat:@"%@",dic[@"commentCount"]] forState:UIControlStateNormal];

}

@end
