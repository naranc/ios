//
//  PersonalViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalTableViewCell.h"
#import "PersonInfoTableViewCell.h"
#import "MyCollectViewController.h"
#import "MyPartInViewController.h"
#import "SettingViewController.h"
#import "MessageViewController.h"
#import "PersonalInfoDetailViewController.h"
#import "PersonApproveViewController.h"
#import "UpLoadIDCardViewController.h"
#import "ContactServiceViewController.h"
#import "MyDonateViewController.h"
#import "AdressListViewController.h"
#import "IDAuthViewController.h"

static NSString * cellitifter0 = @"cellitifter0";
static NSString * cellitifter1 = @"cellitifter1";

@interface PersonalViewController ()<UITableViewDelegate,UITableViewDataSource,PersonalTableViewCellDelegate>

@property (nonatomic, strong) UITableView * personalTableView;

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customNavBar.hidden = YES;
    [self.view addSubview:self.personalTableView];
}
- (UITableView *)personalTableView
{
    if (!_personalTableView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - self.tabBarController.tabBar.height);
        _personalTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _personalTableView.delegate = self;
        _personalTableView.dataSource = self;
        _personalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _personalTableView.showsVerticalScrollIndicator = NO;
        _personalTableView.backgroundColor = [UIColor whiteColor];
        _personalTableView.estimatedRowHeight = 0;
        _personalTableView.estimatedSectionHeaderHeight = 0;
        _personalTableView.estimatedSectionFooterHeight = 0;
    }
    return _personalTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        PersonInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
        if (!cell) {
            cell = [[PersonInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [cell.lvProgressBar setProgress:0.75 animated:YES];
            [cell.loveProgressBar setProgress:0.67 animated:YES];
        });
        cell.onClickMessageButton = ^{
            MessageViewController * messageVC = [[MessageViewController alloc] init];
            messageVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:messageVC animated:YES];
        };
        cell.onClickSettingButton = ^{
            if ([self checkLogin]) {
                SettingViewController * settingVC = [[SettingViewController alloc] init];
                settingVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:settingVC animated:YES];
            }
        };
        cell.onClickUserImageButton = ^{
            if ([self checkLogin]) {
                PersonalInfoDetailViewController * personalInfoVC = [[PersonalInfoDetailViewController alloc] init];
                personalInfoVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:personalInfoVC animated:YES];
            }
        };
        cell.onClickIDButton = ^{
            if ([self checkLogin]) {
                PersonApproveViewController * approveVC = [[PersonApproveViewController alloc] init];
                approveVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:approveVC animated:YES];
            }
//            AVCaptureViewController *AVCaptureVC = [[AVCaptureViewController alloc] init];
//            [self.navigationController pushViewController:AVCaptureVC animated:YES];
//            IDAuthViewController *IDAuthVC = [[IDAuthViewController alloc] init];
//            IDAuthVC.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:IDAuthVC animated:YES];
        };
        return cell;
    }else{
        PersonalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        if (!cell) {
            cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.backgroundColor = kUIColorFromRGB(0xDDDDDD);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if ([WRNavigationBar isIphoneX]) {
            return 330;
        }else{
            return 300;
        }
    }else{
        return (((SCREEN_WIDTH - 1)/ 3) - 16)*3 + 2;
    }
}
- (void)clickWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        if ([self checkLogin]) {
            MyCollectViewController * collectVC = [[MyCollectViewController alloc] init];
            collectVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:collectVC animated:YES];
        }
    }
    if (indexPath.row == 2) {
        if ([self checkLogin]) {
            MyPartInViewController * partInVC = [[MyPartInViewController alloc] init];
            partInVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:partInVC animated:YES];
        }
    }
    if (indexPath.row == 3) {
        if ([self checkLogin]) {
            MyDonateViewController * donateVC = [[MyDonateViewController alloc] init];
            donateVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:donateVC animated:YES];
        }
    }
    if (indexPath.row == 6) {
        if ([self checkLogin]) {
            AdressListViewController * adressListVC = [[AdressListViewController alloc] init];
            adressListVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:adressListVC animated:YES];
        }
    }
    if (indexPath.row == 7) {
        ContactServiceViewController * contactVC = [[ContactServiceViewController alloc] init];
        contactVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contactVC animated:YES];
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
