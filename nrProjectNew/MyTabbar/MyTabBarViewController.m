//
//  MyTabBarViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/15.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "MyTabBar.h"
#import "PublishViewController.h"

@interface MyTabBarViewController ()<MyTabBarDelegate>

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MyTabBar *tabBar = [[MyTabBar alloc] init];
    tabBar.tabBarDelegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}
- (void)tabBarDidClickPlusButton:(MyTabBar *)tabBar
{
    if ([UserModel getUser] == nil) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请登录" duration:MBProgressHUDDuration];
        LoginViewController * loginVC = [[LoginViewController alloc] init];
        UINavigationController *loginNAVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:loginNAVC animated:YES completion:nil];
        return;
    }
    
    
    PublishViewController * publishVC = [[PublishViewController alloc] init];
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:publishVC];
    [self presentViewController:navc animated:YES completion:nil];
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
