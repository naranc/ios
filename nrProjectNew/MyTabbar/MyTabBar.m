//
//  MyTabBar.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/15.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "MyTabBar.h"

@implementation MyTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加一个按钮到tabbar中
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setImage:[UIImage imageNamed:@"nav_fabu"] forState:UIControlStateNormal];
        CGRect temp = plusBtn.frame;
        temp.size=plusBtn.currentImage.size;
        plusBtn.frame=temp;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}
- (void)plusClick
{
    // 通知代理
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickPlusButton:self];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat top;
    if ([WRNavigationBar isIphoneX]) {
        top = 15;
    }else{
        top = 0;
    }
    // 1.设置加号按钮的位置
    CGPoint temp = self.plusBtn.center;
    temp.x=self.frame.size.width/2;
    temp.y=self.frame.size.height/2 - top;
    self.plusBtn.center = temp;
    
    // 2.设置其它UITabBarButton的位置和尺寸
    CGFloat tabbarButtonW = self.frame.size.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            CGRect temp1=child.frame;
            temp1.size.width=tabbarButtonW;
            temp1.origin.x=tabbarButtonIndex * tabbarButtonW;
            child.frame=temp1;
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}
@end
