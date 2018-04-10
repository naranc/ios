//
//  MyPartInViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "MyPartInViewController.h"
#import <MXSegmentedPager/MXSegmentedPager.h>
#import "MyPartInFViewController.h"
#import "MyPartInTViewController.h"

@interface MyPartInViewController ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource>
{
    MyPartInFViewController *vc1;
    MyPartInTViewController *vc2;
}
@property (nonatomic, strong) MXSegmentedPager * segmentedPager;

@end

@implementation MyPartInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"我的参与"];

    
    vc1 = [[MyPartInFViewController alloc] init];
    vc2 = [[MyPartInTViewController alloc] init];
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self.view addSubview:self.segmentedPager];
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = [UIColor orangeColor];
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedPager.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : kUIColorFromRGB(0x999999),NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14]};
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : kUIColorFromRGB(0x333333),NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14]};
    self.segmentedPager.segmentedControl.selectionIndicatorHeight = 2.0f;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = MainColor;
    self.segmentedPager.segmentedControl.borderType = HMSegmentedControlBorderTypeBottom;
    self.segmentedPager.segmentedControl.borderWidth = 0.0f;
    self.segmentedPager.segmentedControl.borderColor = kUIColorFromRGB(0xEEEEEE);
    self.segmentedPager.pager.gutterWidth = 20;
    self.segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 40);
}
- (void)viewWillLayoutSubviews
{
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    self.segmentedPager.frame = (CGRect){
        .origin.x       = 0.f,
        .origin.y       = top,
        .size.width     = self.view.frame.size.width,
        .size.height    = self.view.frame.size.height - top
    };
    [super viewWillLayoutSubviews];
}
- (MXSegmentedPager *)segmentedPager {
    if (!_segmentedPager) {
        // Set a segmented pager
        _segmentedPager = [[MXSegmentedPager alloc] init];
        _segmentedPager.delegate    = self;
        _segmentedPager.dataSource  = self;
    }
    return _segmentedPager;
}
#pragma -mark <MXSegmentedPagerDelegate>

- (void)segmentedPager:(MXSegmentedPager *)segmentedPager didSelectViewWithTitle:(NSString *)title {
    NSLog(@"%@ page selected.", title);
}

#pragma -mark <MXSegmentedPagerDataSource>

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 2;
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    
    return [@[@"援助任务", @"公益活动"] objectAtIndex:index];
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
    
    return @[vc1.view, vc2.view][index];
}
- (CGFloat)heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager
{
    return 32;
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
