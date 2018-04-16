//
//  BCDetailTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BCDetailTableViewCell.h"

@implementation BCDetailTableViewCell

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
        [self addSubview:self.userImageView];
        [self addSubview:self.nameLabelabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.zanButton];
        [self addSubview:self.deleteButton];
    }
    return self;
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
        _nameLabelabel.frame = CGRectMake(_userImageView.right + 8, 22, SCREEN_WIDTH - 30 - 52, 20);
        _nameLabelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameLabelabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _nameLabelabel;
}

- (ImageTextButton *)zanButton
{
    if (!_zanButton) {
        _zanButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _zanButton.frame = CGRectMake(SCREEN_WIDTH - 12 - 50, 24, 50, 17);
        _zanButton.midSpacing = 4;
        _zanButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _zanButton.imageSize = CGSizeMake(12, 12);
        [_zanButton setTitleColor:kUIColorFromRGB(0xFF739A) forState:UIControlStateNormal];
        _zanButton.layoutStyle = ImageTextButtonNSTextAlignmentRight;
        [_zanButton setImage:[UIImage imageNamed:@"list_btn_zan_s_gre2"] forState:UIControlStateNormal];
        
    }
    return _zanButton;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(SCREEN_WIDTH - 14 - 50 - 15 - 100, 24, 100, 17);
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
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


- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _deleteButton.frame = CGRectZero;
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:kUIColorFromRGB(0x6FBBFF) forState:UIControlStateNormal];
        _deleteButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _deleteButton;
}

- (void)setCommentContent:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath
{
    CGFloat contentHeight = [[GlobalSingleton Singleton]getHeigthWithText:model[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]].size.height;
    
    
    _contentLabel.frame = CGRectMake(15, _userImageView.bottom + 8, SCREEN_WIDTH - 30, contentHeight);
    
    _deleteButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 24, _contentLabel.bottom + 12, 24, 17);
    
    
    _contentLabel.text = model[@"content"];
    _userImageView.image = [UIImage imageNamed:model[@"picImage"]];
    _nameLabelabel.text = model[@"name"];
    _timeLabel.text = @"三分钟前";
    
    [_zanButton setTitle:@"12" forState:UIControlStateNormal];
    
}
@end
