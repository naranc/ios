//
//  SubCommTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SubCommTableViewCell.h"
#import "CommentModel.h"

@implementation SubCommTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(SubComment *)model
{
    {
        if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//            self.commentLabel.frame = CGRectMake(0, 0, 0, 0);
            self.commentLabel.frame = CGRectMake(63, 48, SCREEN_WIDTH - 15 - 63 , [[GlobalSingleton Singleton] getHeigthWithText:model.commentContent width:SCREEN_WIDTH - 15 - 63 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height);
            [self addSubview:_commentLabel];
            _commentLabel.text = model.commentContent;

        }
        return self;
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self addSubview:self.lineImageView];
        
        [self addSubview:self.userImageView];
        
        [self addSubview:self.nameLabel];
        
        self.commentLabel.frame = CGRectMake(0, 0, 0, 0);
        
        [self addSubview:_commentLabel];
    }
    return self;
}
- (UILabel *)commentLabel
{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _commentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _commentLabel;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.frame = CGRectMake(48, 0, 1, 30);
        _lineImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineImageView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.frame = CGRectMake(63, 6, 30, 30);
        _userImageView.image = [UIImage imageNamed:@"userimagePic.jpg"];
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
        _nameLabel.frame = CGRectMake(_userImageView.right + 8, 7, SCREEN_WIDTH - 101 - 30, 17);
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _nameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _nameLabel;
}
- (void)setCommentContent:(SubComment *)model indexPath:(NSIndexPath *)indexPath
{
    _lineImageView.frame = CGRectMake(48, 0, 1, [[GlobalSingleton Singleton] getHeigthWithText:model.commentContent width:SCREEN_WIDTH - 15 - 63 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height + 50);
    _commentLabel.frame = CGRectMake(63, 44, SCREEN_WIDTH - 15 - 63 , [[GlobalSingleton Singleton] getHeigthWithText:model.commentContent width:SCREEN_WIDTH - 15 - 63 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height);
    
    _commentLabel.text = model.commentContent;
    
    _nameLabel.text = @"爱如繁星";
}

@end
