//
//  BookDetailHeadView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookDetailHeadView.h"
#import "TopTbTableViewCell.h"
#import "BookIntroView.h"

@implementation BookDetailHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        cellHeight = 12 + 20 + 12 + 20 + 12;
        introStr = @"《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说 ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统，程...";
        CGFloat firstCellHeight = cellHeight - 20 + [[GlobalSingleton Singleton] getHeigthWithText:introStr width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height;
        CGFloat headViewHeight = 20 + 215 + 12 + firstCellHeight + cellHeight*3;
        self.bookTopTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headViewHeight);
        [self addSubview:_bookTopTableView];
        _bookTopTableView.tableHeaderView = self.headView;
        [_headView addSubview:self.bookIntroView];
//        [_bookTopTableView reloadData];
    }
    return self;
}

- (UITableView *)bookTopTableView
{
    if (!_bookTopTableView) {
//        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
//        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 48);
        _bookTopTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _bookTopTableView.delegate = self;
        _bookTopTableView.dataSource = self;
        _bookTopTableView.scrollEnabled = NO;
        _bookTopTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _bookTopTableView.showsVerticalScrollIndicator = NO;
        _bookTopTableView.backgroundColor = [UIColor whiteColor];
        _bookTopTableView.estimatedRowHeight = 0;
        _bookTopTableView.estimatedSectionHeaderHeight = 0;
        _bookTopTableView.estimatedSectionFooterHeight = 0;
        [_bookTopTableView setSeparatorColor:kUIColorFromRGB(0xEEEEEE)];
    }
    return _bookTopTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopTbTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter1212"];
    if (!cell) {
        cell = [[TopTbTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter1212"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.nameLabel.text = @"简介";
        [cell setCommentContent:introStr indexPath:indexPath];
    }else if (indexPath.row == 1){
        cell.nameLabel.text = @"出版社";
        [cell setCommentContent:@"中国人民文学出版社" indexPath:indexPath];

    }else if (indexPath.row == 2){
        cell.nameLabel.text = @"价格";
        [cell setCommentContent:@"130元" indexPath:indexPath];

    }else{
        cell.nameLabel.text = @"页数";
        [cell setCommentContent:@"500页" indexPath:indexPath];

    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return cellHeight - 20 + [[GlobalSingleton Singleton] getHeigthWithText:introStr width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height;
    }else{
        return cellHeight;
    }
}
- (BookIntroView *)bookIntroView
{
    if (!_bookIntroView) {
        _bookIntroView = [[BookIntroView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH - 30, 215)];
        _bookIntroView.layer.cornerRadius = 4.0f;
        [_bookIntroView.layer masksToBounds];
        _bookIntroView.backgroundColor = kUIColorFromRGB(0xffffff);
        _bookIntroView.layer.shadowColor = kUIColorFromRGBWithAlpha(0x000000, 0.2).CGColor;
        _bookIntroView.layer.shadowOffset = CGSizeMake(0, 0);
        _bookIntroView.layer.shadowOpacity = 22;
        _bookIntroView.layer.shadowRadius = 22;
    }
    return _bookIntroView;
}
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20+215+12);
    }
    return _headView;
}
@end
