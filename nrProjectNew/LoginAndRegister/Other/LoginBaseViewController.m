//
//  LoginBaseViewController.m
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "LoginBaseViewController.h"
#import "LoginViewController.h"
#import "ResetPasswordViewController.h"
#import "RegisterViewController.h"
@interface LoginBaseViewController ()

@end

@implementation LoginBaseViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    
    /***
        * 设置登录注册的背景图
     ***/
    UIImageView * bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"backImage"];
    [self.view addSubview:bgImageView];
    
    if (![self isKindOfClass:[LoginViewController class]]) {
        UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(SCREEN_WIDTH - 16 - 34, 26, 34, 34);
        [cancelButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        cancelButton.backgroundColor = [UIColor clearColor];
        [cancelButton setTintColor:[UIColor blackColor]];
        [self.view addSubview:cancelButton];
        if ([WRNavigationBar isIphoneX]) {
            cancelButton.frame = CGRectMake(SCREEN_WIDTH - 16 - 34, 50, 34, 34);
        }
        [cancelButton addAction:^(UIButton *btn) {
            [self.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, top - 33, SCREEN_WIDTH, 24)];
        titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        titleLabel.textColor = kUIColorFromRGB(0x333333);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:titleLabel];

        /***
            * 设置修改密码和注册的title
         ***/
        if ([self isKindOfClass:[ResetPasswordViewController class]]) {
            titleLabel.text = @"忘记密码";

        }else{
            titleLabel.text = @"注册";
        }
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
