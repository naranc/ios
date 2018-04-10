//
//  PRankingViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PRankingViewController.h"
#import <MXSegmentedPager/MXSegmentedPager.h>
#import "IntelligentViewController.h"
#import "GradeViewController.h"
#import "AchievementViewController.h"

@interface PRankingViewController ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource>
{
    IntelligentViewController *vc1;
    GradeViewController *vc2;
    AchievementViewController *vc3;
}

@property (nonatomic, strong) MXSegmentedPager * segmentedPager;
@end

@implementation PRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"公益榜"];

    vc1 = [[IntelligentViewController alloc] init];
    vc2 = [[GradeViewController alloc] init];
    vc3 = [[AchievementViewController alloc] init];
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
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
    return 3;
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    
    return [@[@"公益达人", @"等级", @"成就"] objectAtIndex:index];
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
    
    return @[vc1.view, vc2.view, vc3.view][index];
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
