//
//  BookstoreViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookstoreViewController.h"
#import "BookStoreTopCell.h"
#import "RecommendBookCell.h"
#import "BookrackViewController.h"
#import "BookwormViewController.h"
#import "BookFamilyViewController.h"
#import "BookExcerptViewController.h"

static NSString * cellitifter = @"cellitifter";

@interface BookstoreViewController ()<UITableViewDelegate, UITableViewDataSource,BookStoreTopCellDelegate>

@property (nonatomic, strong)UITableView * bookTableView;

@end

@implementation BookstoreViewController
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    BookStoreTopCell * cell = [_bookTableView cellForRowAtIndexPath:indexPath];
    [cell.noticeView.timer invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.customNavBar setTitle:@"爱的书屋"];
    [self.customNavBar wr_setRightButtonWithImage:[UIImage imageNamed:@"topnav_btn_sousuo999"]];
    [self.view addSubview:self.bookTableView];
}


- (UITableView *)bookTableView
{
    if (!_bookTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _bookTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _bookTableView.delegate = self;
        _bookTableView.dataSource = self;
        _bookTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bookTableView.showsVerticalScrollIndicator = NO;
        _bookTableView.backgroundColor = [UIColor whiteColor];
        _bookTableView.estimatedRowHeight = 0;
        _bookTableView.estimatedSectionHeaderHeight = 0;
        _bookTableView.estimatedSectionFooterHeight = 0;
        _bookTableView.alwaysBounceVertical = NO;
        _bookTableView.bounces = NO;
    }
    return _bookTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        BookStoreTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[BookStoreTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        RecommendBookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
        if (!cell) {
            cell = [[RecommendBookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 1) {
            cell.cellTitle = @"一周热门榜";
        }else{
            cell.cellTitle = @"书单推荐";
        }
        return cell;
    }


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 366;
    }else{
        return 476;
    }
}
- (void)clickTopSlectType:(NSInteger)type
{
    if (type == 1001) {
        BookrackViewController * bookrackVC = [[BookrackViewController alloc] init];
        [self.navigationController pushViewController:bookrackVC animated:YES];
    }
    
    if (type == 1002) {
        BookwormViewController * bookwormVC = [[BookwormViewController alloc] init];
        [self.navigationController pushViewController:bookwormVC animated:YES];
    }
    
    if (type == 1003) {
        BookFamilyViewController * bookFamilyVC = [[BookFamilyViewController alloc] init];
        [self.navigationController pushViewController:bookFamilyVC animated:YES];
    }
    
    if (type == 1004) {
        BookExcerptViewController * bookExcerptVC = [[BookExcerptViewController alloc] init];
        [self.navigationController pushViewController:bookExcerptVC animated:YES];
    }
    
}
#pragma mark - UIScrollViewDelegate
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
