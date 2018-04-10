//
//  SettingViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate>

@property (nonatomic, strong) UITableView * settingTableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"个人设置"];
    

    [self.view addSubview:self.settingTableView];

}
- (UITableView *)settingTableView
{
    if (!_settingTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _settingTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        _settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _settingTableView.showsVerticalScrollIndicator = NO;
        _settingTableView.backgroundColor = [UIColor whiteColor];
        _settingTableView.estimatedRowHeight = 0;
        _settingTableView.estimatedSectionHeaderHeight = 0;
        _settingTableView.estimatedSectionFooterHeight = 0;
    }
    return _settingTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * cellitifter0 = @"setCellitifter0";
        SettingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
        if (!cell) {
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0 showSwitchBtn:YES];
        }
        cell.optionalImageView.image = [UIImage imageNamed:@"wode_xiaoxituisong"];
        cell.optionalabel.text = @"消息推送";
        return cell;
    }else if(indexPath.section == 1 || indexPath.section == 2){
        static NSString * cellitifter1 = @"setCellitifter1";
        SettingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        
        if (!cell) {
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1 showSwitchBtn:NO];
        }
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.optionalImageView.image = [UIImage imageNamed:@"wode_yijianfankui"];
                cell.optionalabel.text = @"意见反馈";
                
            }else if (indexPath.row == 1){
                cell.optionalImageView.image = [UIImage imageNamed:@"wode_yaoqinghaoyou"];
                cell.optionalabel.text = @"邀请好友";
                
            }else if (indexPath.row == 2){
                cell.optionalImageView.image = [UIImage imageNamed:@"wode_xiugaimima"];
                cell.optionalabel.text = @"修改密码";
            }else{
                cell.optionalImageView.image = [UIImage imageNamed:@"wode_guanyunaran"];
                cell.optionalabel.text = @"关于那然";
            }
        }else{
            cell.optionalImageView.image = [UIImage imageNamed:@"wode_haoping"];
            cell.optionalabel.text = @"给那然公益一个好评";
        }
        return cell;
        
    }else{
        
        static NSString * cellitifter2 = @"setCellitifter2";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
        }
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        UIButton * logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
        logoutButton.frame = CGRectMake(15, 0, SCREEN_WIDTH - 30, 38);
        [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        logoutButton.titleLabel.font = font;
        logoutButton.backgroundColor = MainColor;
        logoutButton.clipsToBounds = YES;
        logoutButton.layer.cornerRadius = 4.0f;
        [logoutButton setTintColor:kUIColorFromRGB(0xFFFFFF)];
        [cell.contentView addSubview:logoutButton];
        [logoutButton addAction:^(UIButton *btn) {
            UIAlertView * alterView;
            if (!alterView) {
                alterView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"确定退出登录？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            }
            [alterView show];
        } forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 17;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 4;
    }else if (section ==2){
        return 1;
    }else{
        return 1;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            //意见反馈
//            FeedbackViewController * feedbackVC = [[FeedbackViewController alloc] init];
//            feedbackVC.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:feedbackVC animated:YES];
        }
        if (indexPath.row == 1) {
//            [self goShareAction];
        }
        if (indexPath.row == 2) {
            //修改密码
//            ChangePasswordViewController * changePasswordVC = [[ChangePasswordViewController alloc] init];
//            [self.navigationController pushViewController:changePasswordVC animated:YES];
        }
        if (indexPath.row == 3) {
            //关于那然
//            AboutNRViewController * aboutNRVC = [[AboutNRViewController alloc] init];
//            aboutNRVC.titleStr = @"关于那然";
//            aboutNRVC.webViewUrlStr = [NSString stringWithFormat:@"%@/home/about_us",BaseUrl];
//            [self.navigationController pushViewController:aboutNRVC animated:YES];
            
        }
        
    }else{
//        NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", @"1144895152"];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [UserModel logOutSuccess:^(NSDictionary *dic) {
            [UserModel deleteUser];
            [self.navigationController popToRootViewControllerAnimated:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationLoginSuccess" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationLogoutSuccess" object:nil];
        } withFailureBlock:^(NSError *error) {
            NSLog(@"error = %@",error);
        }];
        
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
