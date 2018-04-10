//
//  AppDelegate.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/6.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "LoveViewController.h"
#import "PersonalViewController.h"
// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate ()<UITabBarControllerDelegate,JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if (@available(iOS 11.0, *)){//避免滚动视图顶部出现20的空白以及push或者pop的时候页面有一个上移或者下移的异常动画的问题
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    [UINavigationBar appearance].translucent = NO;
    //tabbar 选中时候的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:MainColor} forState:UIControlStateSelected];
    
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:JPUSAPPHKEY
                          channel:nil
                 apsForProduction:NO
            advertisingIdentifier:nil];
    
    

    [self initViewController];
    return YES;
}

- (void)initViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    UINavigationController *loveNav = [[UINavigationController alloc] initWithRootViewController:[LoveViewController new]];
    UINavigationController *personalNav = [[UINavigationController alloc] initWithRootViewController:[PersonalViewController new]];

    _tabBarController = [MyTabBarViewController new];
    _tabBarController.viewControllers = @[firstNav, secondNav,loveNav,personalNav];
    _tabBarController.delegate = self;
    [self setTabBarItems:_tabBarController];
    
    self.window.rootViewController = _tabBarController;
    [self.window makeKeyAndVisible];
}

- (void)setTabBarItems:(UITabBarController*)tabBarVC
{
    NSArray *titles = @[@"首页",@"宠物",@"爱心",@"我的"];
    NSArray *normalImages = @[@"nav_index",@"nav_zhongshu",@"nav_cishanjia",@"nav_wode"];
    NSArray *highlightImages = @[@"nav_index_pre",@"nav_zhongshu_pre",@"nav_cishanjia_pre",@"nav_wode_pre"];
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
        obj.image = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.selectedImage = [[UIImage imageNamed:highlightImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UINavigationController * nav = (UINavigationController *)viewController;
    UserModel * user = [UserModel getUser];
    if ([nav.viewControllers[0] isKindOfClass:[PersonalViewController class]]) {
        //        NSLog(@"nav.viewControllers = %@",nav.viewControllers);
        if (!user) {
            //调试
            LoginViewController * loginVC = [[LoginViewController alloc] init];
            UINavigationController *ANavigationController = [[UINavigationController alloc] initWithRootViewController:loginVC];
            [nav.viewControllers[0] presentViewController:ANavigationController animated:YES completion:nil];
        }
        
    }
    
//    if ([nav.viewControllers[0] isKindOfClass:[PersonalViewController class]]) {
//        //        NSLog(@"nav.viewControllers = %@",nav.viewControllers);
//        if (!user) {
//            //调试
//            LoginViewController * loginVC = [[LoginViewController alloc] init];
//            UINavigationController *ANavigationController = [[UINavigationController alloc] initWithRootViewController:loginVC];
//            [nav.viewControllers[0] presentViewController:ANavigationController animated:YES completion:nil];
//        }
//
//    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
    NSLog(@"deviceToken = %@",deviceToken);
}

#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // notification
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert);
    //需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withComplevoidtionHandler:(void (^)(void))completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();
    //系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}

#pragma mark- JPUSHRegisterDelegateEnd


@end
