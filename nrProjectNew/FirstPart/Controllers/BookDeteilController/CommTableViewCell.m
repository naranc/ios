//
//  CommentTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "CommTableViewCell.h"
#import "CommentModel.h"
#import "SubCommTableViewCell.h"

@implementation CommTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(CommentModel *)model
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.commentTableView];
        _commentTableView.tableHeaderView = self.headView;
        [_headView addSubview:self.topCommentLabel];
        [_headView addSubview:self.userImageView];
        [_headView addSubview:self.nameLabel];
        [_headView addSubview:self.zanBtn];
        [_headView addSubview:self.commentBtn];
        _commentTableView.tableFooterView = self.footerView;
        [_footerView addSubview:self.timeLabel];
        [_footerView addSubview:self.moreCommentBtn];
    }
    return self;
}
- (void)setCommentContent:(CommentModel *)model indexPath:(NSIndexPath *)indexPath
{
    _subCommentArray = model.subComments;
    _commentModel = model;
    
    CGFloat height =  [[GlobalSingleton Singleton] getHeigthWithText:model.commentContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height + 64 + 40;
    
    _commentTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, [self cellForHeight:model.subComments] + height);
    
    _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height - 40);
    _topCommentLabel.frame = CGRectMake(15, 60, SCREEN_WIDTH - 30, height - 60 - 40);
    _topCommentLabel.text = model.commentContent;
    _nameLabel.text = @"逆光而行";
    [_commentTableView reloadData];
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectMake(0, 0, 0, 0);
//        _headView.backgroundColor = [UIColor cyanColor];
    }
    return _headView;
}

- (UIView *)footerView
{
    if (!_footerView) {
        _footerView = [[UIView alloc] init];
        _footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
//        _footerView.backgroundColor = [UIColor cyanColor];
    }
    return _footerView;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(16, 15, (SCREEN_WIDTH - 32)/2, 17);
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
        _timeLabel.text = @"3分钟前";
    }
    return _timeLabel;
}
- (UIButton *)moreCommentBtn
{
    if (!_moreCommentBtn) {
        _moreCommentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _moreCommentBtn.frame = CGRectMake(SCREEN_WIDTH - 15 - 104, 12, 110, 20);
        [_moreCommentBtn setTitle:@"查看全部9条回复" forState:UIControlStateNormal];
        [_moreCommentBtn setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _moreCommentBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    }
    return _moreCommentBtn;
}
- (UILabel *)topCommentLabel
{
    if (!_topCommentLabel) {
        _topCommentLabel = [[UILabel alloc] init];
        _topCommentLabel.frame = CGRectZero;
        _topCommentLabel.numberOfLines = 0;
        _topCommentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _topCommentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _topCommentLabel;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.frame = CGRectMake(15, 12, 40, 40);
        _userImageView.image = [UIImage imageNamed:@"userimagePic.jpg"];
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.layer.cornerRadius = 40/2;
        _userImageView.clipsToBounds = YES;
    }
    return _userImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(_userImageView.right + 8, 22, SCREEN_WIDTH - 63 - 90, 20);
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _nameLabel;
}
- (ImageTextButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _zanBtn.frame = CGRectMake(SCREEN_WIDTH - 25 - 40, 26, 40, 17);
        _zanBtn.midSpacing = 2;
        _zanBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _zanBtn.imageSize = CGSizeMake(12, 12);
        [_zanBtn setTitle:@"18" forState:UIControlStateNormal];
        [_zanBtn setTitleColor:kUIColorFromRGB(0xFF739A) forState:UIControlStateNormal];
        _zanBtn.layoutStyle = ImageTextButtonNSTextAlignmentRight;
        [_zanBtn setImage:[UIImage imageNamed:@"list_btn_zan_s_gre2"] forState:UIControlStateNormal];
        
    }
    return _zanBtn;
}
- (ImageTextButton *)commentBtn
{
    if (!_commentBtn) {
        _commentBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentBtn.frame = CGRectMake(SCREEN_WIDTH - 25 - 40 - 40, 26, 40, 17);
        _commentBtn.midSpacing = 2;
        _commentBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commentBtn.imageSize = CGSizeMake(12, 12);
        [_commentBtn setTitle:@"7" forState:UIControlStateNormal];
        [_commentBtn setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _commentBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_commentBtn setImage:[UIImage imageNamed:@"list_btn_pinglun3"] forState:UIControlStateNormal];
        
    }
    return _commentBtn;
}

- (UITableView *)commentTableView
{
    if (!_commentTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 48);
        _commentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _commentTableView.delegate = self;
        _commentTableView.dataSource = self;
        _commentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _commentTableView.showsVerticalScrollIndicator = NO;
        _commentTableView.scrollEnabled = NO;
        _commentTableView.backgroundColor = [UIColor whiteColor];
        _commentTableView.estimatedRowHeight = 0;
        _commentTableView.estimatedSectionHeaderHeight = 0;
        _commentTableView.estimatedSectionFooterHeight = 0;
    }
    return _commentTableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubComment  * subCommentModel;
    if (_subCommentArray.count) {
        subCommentModel = _subCommentArray[indexPath.row];
    }
    SubCommTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter"];
    if (!cell) {
        cell = [[SubCommTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCommentContent:subCommentModel indexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _subCommentArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubComment * subComment;
    if (_subCommentArray.count) {
        subComment = _subCommentArray[indexPath.row];
    }
    return [[GlobalSingleton Singleton] getHeigthWithText:subComment.commentContent width:SCREEN_WIDTH - 15 - 63 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height + 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    BookDetailViewController * bookDetailVC = [[BookDetailViewController alloc] init];
//    bookDetailVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:bookDetailVC animated:YES];
}
- (CGFloat)cellForHeight:(NSArray *)array
{
    CGFloat height = 0.0;
    for (SubComment *subComm in array) {
        height = height + [[GlobalSingleton Singleton] getHeigthWithText:subComm.commentContent width:SCREEN_WIDTH - 15 - 63 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height + 50;
    }
    return height;
}
@end
