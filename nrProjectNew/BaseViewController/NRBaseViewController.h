//
//  NRBaseViewController.h
//  naran
//
//  Created by 那然 on 2017/11/21.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRCustomNavigationBar.h"
#import <MBProgressHUD/MBProgressHUD.h>


@interface MBProgressHUD (ShowWithDuration)
- (void)show:(BOOL)animated duration:(NSTimeInterval)duration;
- (void)show:(BOOL)animated text:(NSString *)text duration:(NSTimeInterval)duration;
+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated text:(NSString *)text duration:(NSTimeInterval)duration;

@end

@interface NRBaseViewController : UIViewController

- (BOOL)checkLogin;

@property (nonatomic, strong) WRCustomNavigationBar *customNavBar;

@end
