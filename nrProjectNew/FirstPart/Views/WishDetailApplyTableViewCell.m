//
//  WishDetailApplyTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/17.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "WishDetailApplyTableViewCell.h"
#import "JGGView.h"


@interface WishDetailApplyTableViewCell ()
{
    JGGView * jggView;
}
@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * userImageview;

@property (nonatomic, strong) UILabel * userNickNameLabel;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UILabel * timeLabel;

@end

@implementation WishDetailApplyTableViewCell

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
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self.contentView layoutIfNeeded];
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgView];
        [_bgView addSubview:self.userImageview];
        [_bgView addSubview:self.userNickNameLabel];
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.contentLabel];
        jggView = [JGGView new];
        [_bgView addSubview:jggView];
        [_bgView addSubview:self.timeLabel];

    }
    return self;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UIImageView *)userImageview
{
    if (!_userImageview) {
        _userImageview = [[UIImageView alloc] init];
        _userImageview.frame = CGRectMake(15, 16, 40, 40);
        _userImageview.clipsToBounds = YES;
        _userImageview.layer.cornerRadius = 20;
        _userImageview.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _userImageview;
}
- (UILabel *)userNickNameLabel
{
    if (!_userNickNameLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.frame = CGRectMake(_userImageview.right + 8, 15 + 10, 200, 20);
        _userNickNameLabel.font = nameFont;
        _userNickNameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _userNickNameLabel;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, _userImageview.bottom + 12, SCREEN_WIDTH - 30, 20);
        _titleLabel.font = nameFont;
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = nameFont;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _contentLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = nameFont;
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _timeLabel;
}
- (void)wishDetailViewConfigCellWithModel:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath
{
    //布局九宫格
    //解决图片复用问题
    [_userImageview sd_setImageWithURL:[NSURL URLWithString:model[@"accountImg"]] placeholderImage:nil];

    [jggView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray * imageArray;
    if ([model[@"applyImgs"] containsString:@","]) {
        imageArray = [model[@"applyImgs"] componentsSeparatedByString:@","];//以“,”切割
        if (imageArray.count > 3) {
            NSArray *smallArray = [imageArray subarrayWithRange:NSMakeRange(0, 3)];
            imageArray = smallArray;
        }
    }else{
        imageArray = @[model[@"applyImgs"]];
    }
    [jggView JGGView:jggView DataSource:imageArray completeBlock:^(NSInteger index, NSArray *dataSource,NSIndexPath *indexpath) {
        //        self.tapImageBlock(index,dataSource,self.indexPath);
    }];
    
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model[@"applyContent"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    
    _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 16 + 40 + 12 + 20 + 8 + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 45);
    
    _contentLabel.frame = CGRectMake(15, _titleLabel.bottom + 8, SCREEN_WIDTH - 30, rect.size.height);
    
    jggView.frame = CGRectMake(15, _contentLabel.bottom + 8, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 40)/3);
    
    _timeLabel.frame = CGRectMake(15, jggView.bottom + 12, SCREEN_WIDTH - 30, 16);

    _userNickNameLabel.text = model[@"accountNike"];
    
    _titleLabel.text = model[@"applyTitle"];
    
    _contentLabel.text = model[@"applyContent"];
    
    _timeLabel.text = @"更新于1分钟前";

}
@end
