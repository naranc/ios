//
//  BookRackTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookRackTableViewCell.h"

@interface BookRackTableViewCell ()

@property (nonatomic, strong) UIImageView * markImageView;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * userNickNameLabel;

@property (nonatomic, strong) UILabel * numberLabel;

@end

@implementation BookRackTableViewCell

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
        [self addSubview:self.markImageView];
        [self addSubview:self.userImageView];
        [self addSubview:self.userNickNameLabel];
        [self addSubview:self.numberLabel];
    }
    return self;
}
- (UIImageView *)markImageView
{
    if (!_markImageView) {
        _markImageView = [[UIImageView alloc] init];
        _markImageView.contentMode = UIViewContentModeCenter;
        _markImageView.clipsToBounds = YES;
    }
    return _markImageView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.clipsToBounds = YES;
        _userImageView.layer.cornerRadius = 20.0f;
    }
    return _userImageView;
}
- (UILabel *)userNickNameLabel
{
    if (!_userNickNameLabel) {
        _userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.textColor = kUIColorFromRGB(0x666666);
        _userNickNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _userNickNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNickNameLabel;
}
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = kUIColorFromRGB(0xF7AF39);
        _numberLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _numberLabel.textAlignment = NSTextAlignmentRight;
    }
    return _numberLabel;
}
- (void)layoutSubviews
{
    CGFloat widht = (SCREEN_WIDTH - 30 - 12.8 - 8 - 23.1 - 40)/2;
    
    _markImageView.frame = CGRectMake(15, 17, 23.1, 29);
    
    _userImageView.frame = CGRectMake(_markImageView.right + 12.8, 12, 40, 40);
    
    _userNickNameLabel.frame = CGRectMake(_userImageView.right + 8, 22, widht, 20);
    
    _numberLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - widht, 20, widht, 24);
}
- (void)configCellWithModel:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath
{
    _markImageView.hidden = NO;
    if (indexPath.row == 0) {
        _markImageView.image = [UIImage imageNamed:@"gyb_jinpai"];
    }else if (indexPath.row == 1){
        _markImageView.image = [UIImage imageNamed:@"gyb_yinpai"];
    }else if (indexPath.row == 2){
        _markImageView.image = [UIImage imageNamed:@"gyb_tongpai"];
    }else{
        _markImageView.hidden = YES;
    }
    _userNickNameLabel.text = @"a测试111";
    _numberLabel.text = @"256";
    _userImageView.image = [UIImage imageNamed:@"userimagePic.jpg"];
}


@end
