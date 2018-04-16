//
//  SecondViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/8.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "SecondViewController.h"

#import "HelpHerViewController.h"
#import "SendApplyViewController.h"
#import "InputWayNumberViewController.h"
#import "CarriagingViewController.h"
#import "TFeedbackViewController.h"
#import "WishDoneViewController.h"
#import "SellerAffirmViewController.h"
#import "PartinTaskViewController.h"
#import "TaskDoneViewController.h"
#import "ReportViewController.h"
#import "AffirmBookViewController.h"

@interface SecondViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray * testArray;

@property (nonatomic, strong) UITableView * testTableView;

@end

@implementation SecondViewController
- (NSMutableArray *)testArray
{
    if (!_testArray) {
        _testArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _testArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"测试页面"];
    
    [self.testArray addObject:@"帮TA实现"];
    [self.testArray addObject:@"发起申请"];
    [self.testArray addObject:@"输入运单号"];
    [self.testArray addObject:@"运输中"];
    [self.testArray addObject:@"感谢反馈"];
    [self.testArray addObject:@"心愿达成"];
    [self.testArray addObject:@"捐赠达成"];
    [self.testArray addObject:@"确认信息"];

    [self.testArray addObject:@"援助任务"];
    
    [self.testArray addObject:@"任务完成"];

    [self.testArray addObject:@"举报"];
    
    [self.testArray addObject:@"确认收书"];


    [self.view addSubview:self.testTableView];
}

- (UITableView *)testTableView
{
    if (!_testTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - self.tabBarController.tabBar.height);
        _testTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _testTableView.delegate = self;
        _testTableView.dataSource = self;
        _testTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _testTableView.showsVerticalScrollIndicator = NO;
        _testTableView.backgroundColor = [UIColor whiteColor];
        _testTableView.estimatedRowHeight = 0;
        _testTableView.estimatedSectionHeaderHeight = 0;
        _testTableView.estimatedSectionFooterHeight = 0;
    }
    return _testTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _testArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellitifter = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
        cell.textLabel.text = _testArray[indexPath.row];
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        HelpHerViewController * testVC = [[HelpHerViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 1) {
        SendApplyViewController * testVC = [[SendApplyViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 2) {
        InputWayNumberViewController * testVC = [[InputWayNumberViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 3) {
        CarriagingViewController * testVC = [[CarriagingViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 4) {
        TFeedbackViewController * testVC = [[TFeedbackViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 5) {
        WishDoneViewController * testVC = [[WishDoneViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        testVC.type = @"心愿达成";
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 6) {
        WishDoneViewController * testVC = [[WishDoneViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        testVC.type = @"捐赠达成";
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 7) {
        SellerAffirmViewController * testVC = [[SellerAffirmViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 8) {
        PartinTaskViewController * testVC = [[PartinTaskViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 9) {
        TaskDoneViewController * testVC = [[TaskDoneViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 10) {
        ReportViewController * testVC = [[ReportViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }
    if (indexPath.row == 11) {
        AffirmBookViewController * testVC = [[AffirmBookViewController alloc] init];
        testVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:testVC animated:YES];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
