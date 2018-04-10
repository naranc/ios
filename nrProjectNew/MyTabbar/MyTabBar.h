//
//  MyTabBar.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/15.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;

@protocol MyTabBarDelegate <UITabBarDelegate>

- (void)tabBarDidClickPlusButton:(MyTabBar *)tabBar;

@end

@interface MyTabBar : UITabBar

@property (strong,nonatomic) UIButton *plusBtn;

@property (nonatomic, weak) id<MyTabBarDelegate> tabBarDelegate;

@end
