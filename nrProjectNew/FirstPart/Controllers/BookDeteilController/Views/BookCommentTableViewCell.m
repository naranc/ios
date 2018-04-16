//
//  BookCommentTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookCommentTableViewCell.h"

@implementation BookCommentTableViewCell

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
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.userImageView];
        [_bgView addSubview:self.nameLabelabel];
        [_bgView addSubview:self.contentLabel];
        [_bgView addSubview:self.lineImageView];
        [_bgView addSubview:self.timeLabel];
        [_bgView addSubview:self.commentButton];
        [_bgView addSubview:self.zanButton];
    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectZero;
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.frame = CGRectMake(15, 12, 40, 40);
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.clipsToBounds = YES;
        _userImageView.layer.cornerRadius = 40/2;
    }
    return _userImageView;
}
- (UILabel *)nameLabelabel
{
    if (!_nameLabelabel) {
        _nameLabelabel = [[UILabel alloc] init];
        _nameLabelabel.frame = CGRectMake(_userImageView.right + 12, 22, SCREEN_WIDTH - 30 - 52, 20);
        _nameLabelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameLabelabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _nameLabelabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = CGRectZero;
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _contentLabel;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.frame = CGRectZero;
        _lineImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineImageView;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectZero;
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _timeLabel;
}
- (ImageTextButton *)commentButton
{
    if (!_commentButton) {
        _commentButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentButton.frame = CGRectZero;
        _commentButton.midSpacing = 6;
        _commentButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commentButton.imageSize = CGSizeMake(16, 16);
        [_commentButton setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _commentButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_commentButton setImage:[UIImage imageNamed:@"list_btn_pinglun3"] forState:UIControlStateNormal];
        
    }
    return _commentButton;
}

- (ImageTextButton *)zanButton
{
    if (!_zanButton) {
        _zanButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _zanButton.frame = CGRectZero;
        _zanButton.midSpacing = 6;
        _zanButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _zanButton.imageSize = CGSizeMake(16, 16);
        [_zanButton setTitleColor:kUIColorFromRGB(0xFF739A) forState:UIControlStateNormal];
        _zanButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_zanButton setImage:[UIImage imageNamed:@"list_btn_zan_s_gre2"] forState:UIControlStateNormal];
        
    }
    return _zanButton;
}

- (void)setCommentContent:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath
{
    CGFloat contentHeight = [[GlobalSingleton Singleton]getHeigthWithText:model[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]].size.height;

    _bgView.frame = CGRectMake(0, 8, SCREEN_WIDTH, contentHeight + 130 - 8);
    
    _contentLabel.frame = CGRectMake(15, _userImageView.bottom + 16, SCREEN_WIDTH - 30, contentHeight);
    
    _lineImageView.frame = CGRectMake(15, _contentLabel.bottom + 12, SCREEN_WIDTH - 30, 1);
    
    _timeLabel.frame = CGRectMake(15, _lineImageView.bottom + 12, (SCREEN_WIDTH -30)/ 3, 17);
    
    _commentButton.frame = CGRectMake(_timeLabel.right, _lineImageView.bottom + 12, (SCREEN_WIDTH -30)/ 3, 17);
    
    _zanButton.frame = CGRectMake(_commentButton.right, _lineImageView.bottom + 12, (SCREEN_WIDTH -30)/ 3, 17);
    
    
    _contentLabel.text = model[@"content"];
    _userImageView.image = [UIImage imageNamed:model[@"picImage"]];
    _nameLabelabel.text = model[@"name"];
    _timeLabel.text = @"三分钟前";

    
    [_commentButton setTitle:@"12" forState:UIControlStateNormal];
    [_zanButton setTitle:@"12" forState:UIControlStateNormal];

}

@end
