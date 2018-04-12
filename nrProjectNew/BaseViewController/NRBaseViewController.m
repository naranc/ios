//
//  NRBaseViewController.m
//  naran
//
//  Created by 那然 on 2017/11/21.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "NRBaseViewController.h"
#import "FirstViewController.h"
#import "SelectTagsViewController.h"
#import "HomeViewController.h"

@implementation MBProgressHUD (ShowWithDuration)

- (void)show:(BOOL)animated duration:(NSTimeInterval)duration{
    [self show:animated text:nil duration:duration];
}
- (void)show:(BOOL)animated text:(NSString *)text duration:(NSTimeInterval)duration{
    self.label.text = text;
    [self showAnimated:animated];
    [self hideAnimated:YES afterDelay:duration];
}

+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated text:(NSString *)text duration:(NSTimeInterval)duration{
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = text;
    [view addSubview:hud];
    [hud showAnimated:animated];
    [hud performSelector:@selector(hide:) withObject:[NSNumber numberWithBool:animated] afterDelay:duration];
    return hud;
}


@end


@interface NRBaseViewController ()

@end

@implementation NRBaseViewController
- (BOOL)checkLogin
{
    UserModel * user = [UserModel getUser];
    if (user) {
        return YES;
    }else{
        LoginViewController * loginVC = [[LoginViewController alloc] init];
        UINavigationController *ANavigationController = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [MBProgressHUD showHUDAddedTo:loginVC.view animated:YES text:@"请先登录" duration:MBProgressHUDDuration];
        [self.navigationController presentViewController:ANavigationController animated:YES completion:nil];
        return NO;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = kUIColorFromRGB(0XF5F5F5);
    if ([self isKindOfClass:[HomeViewController class]] || [self isKindOfClass:[SelectTagsViewController class]]) {
        self.view.backgroundColor = kUIColorFromRGB(0XFFFFFF);
//        self.navigationController.navigationBar.hidden = NO;

    }
    [self setupNavBar];
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    
    // 设置自定义导航栏背景图片
//    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"millcolorGrad"];
    
    // 设置自定义导航栏标题颜色
    self.customNavBar.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    self.customNavBar.titleLabelColor = kUIColorFromRGB(0x333333);
    self.customNavBar.titleLabelFont = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.customNavBar.frame;  // 设置显示的frame
    gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
    //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    gradientLayer.endPoint = CGPointMake(1, 0);     //
    [self.customNavBar.layer addSublayer:gradientLayer];
    
//    [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"nav_back"]];
    [self.customNavBar setTitleLabelFont:[UIFont fontWithName:@"PingFangSC-Medium" size:17]];
    [self.customNavBar setTitleLabelColor:kUIColorFromRGB(0xFFFFFF)];
    [self.customNavBar wr_setSubViewToFront];
    
    if (self.navigationController.childViewControllers.count != 1) {
     
        [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"nav_back"]];
        weakify(self);
        self.customNavBar.onClickLeftButton = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };

    }
}

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
        [_customNavBar wr_setBottomLineHidden:YES];
    }
    return _customNavBar;
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
