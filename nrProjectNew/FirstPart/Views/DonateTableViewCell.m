//
//  DonateTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/21.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "DonateTableViewCell.h"
#import "JGGView.h"
#import "DonateModel.h"

@interface DonateTableViewCell ()
{
    JGGView * jggView;
}
@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * userImageview;

@property (nonatomic, strong) UILabel * userNickNameLabel;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;


@property (nonatomic, strong) UIImageView * lineView;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) ImageTextButton * shareBtn;

@property (nonatomic, strong) ImageTextButton * commentBtn;

@property (nonatomic, strong) ImageTextButton * collectBtn;

@end

@implementation DonateTableViewCell

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
        
        [_bgView addSubview:self.lineView];
        [_bgView addSubview:self.timeLabel];
        [_bgView addSubview:self.shareBtn];
        [_bgView addSubview:self.commentBtn];
        [_bgView addSubview:self.collectBtn];
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
        _userImageview.image = [UIImage imageNamed:@"xhdpibanner.png"];
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
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
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
- (ImageTextButton *)shareBtn
{
    if (!_shareBtn) {
        _shareBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.midSpacing = 2;
        _shareBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _shareBtn.imageSize = CGSizeMake(15, 15);
        [_shareBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _shareBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_shareBtn setImage:[UIImage imageNamed:@"list_btn_fengxiang"] forState:UIControlStateNormal];
        _shareBtn.tag = 1001;
    }
    return _shareBtn;
}
- (ImageTextButton *)commentBtn
{
    if (!_commentBtn) {
        _commentBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentBtn.midSpacing = 2;
        _commentBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _commentBtn.imageSize = CGSizeMake(16, 15);
        [_commentBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _commentBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_commentBtn setImage:[UIImage imageNamed:@"list_btn_pinglun"] forState:UIControlStateNormal];
        _commentBtn.tag = 1002;
    }
    return _commentBtn;
}
- (ImageTextButton *)collectBtn
{
    if (!_collectBtn) {
        _collectBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _collectBtn.midSpacing = 2;
        _collectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _collectBtn.imageSize = CGSizeMake(17, 16);
        [_collectBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _collectBtn.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_collectBtn setImage:[UIImage imageNamed:@"list_btn_shoucang_pre"] forState:UIControlStateNormal];
        _collectBtn.tag = 1003;
    }
    return _collectBtn;
}
- (void)configCellWithModel:(DonateModel *)model indexPath:(NSIndexPath *)indexPath
{
    //布局九宫格
    //解决图片复用问题
    [jggView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray * imageArray;
    if ([model.orderImgs containsString:@","]) {
         imageArray = [model.orderImgs componentsSeparatedByString:@","];//以“,”切割
        if (imageArray.count > 3) {
            NSArray *smallArray = [imageArray subarrayWithRange:NSMakeRange(0, 3)];
            imageArray = smallArray;
        }
    }else{
        imageArray = @[model.orderImgs];
    }
    [jggView JGGView:jggView DataSource:imageArray completeBlock:^(NSInteger index, NSArray *dataSource,NSIndexPath *indexpath) {
//        self.tapImageBlock(index,dataSource,self.indexPath);
    }];
    
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    
    _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 16 + 40 + 12 + 20 + 8 + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 45);
    
    _contentLabel.frame = CGRectMake(15, _titleLabel.bottom + 8, SCREEN_WIDTH - 30, rect.size.height);
    
    jggView.frame = CGRectMake(15, _contentLabel.bottom + 8, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 40)/3);
    
    _lineView.frame = CGRectMake(15, jggView.bottom + 10, SCREEN_WIDTH - 30, 0.5);
    
    _timeLabel.frame = CGRectMake(15, _lineView.bottom + 8, 80, 16);
    
    _collectBtn.frame = CGRectMake(SCREEN_WIDTH - 27 - 40 , _lineView.bottom + 8, 40, 17);
    
    _commentBtn.frame = CGRectMake(SCREEN_WIDTH - 27 - 40 - 10 - 40 , _lineView.bottom + 8, 40, 17);
    
    _shareBtn.frame = CGRectMake(SCREEN_WIDTH - 27 - 40 - 10 - 40 - 10 - 40, _lineView.bottom + 8, 40, 17);
    
    if (model.commentTimes) {
        [_commentBtn setTitle:[NSString stringWithFormat:@"%@",model.commentTimes] forState:UIControlStateNormal];
    }else{
        [_commentBtn setTitle:@"0" forState:UIControlStateNormal];
    }
    
    if (model.collectionTimes) {
        [_collectBtn setTitle:[NSString stringWithFormat:@"%@",model.collectionTimes] forState:UIControlStateNormal];
    }else{
        [_collectBtn setTitle:@"0" forState:UIControlStateNormal];
    }
    
    [_shareBtn setTitle:@"0" forState:UIControlStateNormal];

    _userNickNameLabel.text = model.initiatorNike;
    
    _titleLabel.text = model.orderTitle;
    
    _contentLabel.text = model.orderContent;
    
    _timeLabel.text = [[GlobalSingleton Singleton] compareCurrentTime:model.createTime];
    
}





@end
