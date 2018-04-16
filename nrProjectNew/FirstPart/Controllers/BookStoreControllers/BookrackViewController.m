//
//  BookrackViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookrackViewController.h"
#import <MXSegmentedPager/MXSegmentedPager.h>
#import "BookrackSubViewController.h"

@interface BookrackViewController ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource>
{
    BookrackSubViewController *vc1;
    BookrackSubViewController *vc2;
    BookrackSubViewController *vc3;
    BookrackSubViewController *vc4;
    BookrackSubViewController *vc5;
    BookrackSubViewController *vc6;
}

@property (nonatomic, strong) MXSegmentedPager * segmentedPager;

@end

@implementation BookrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"书架"];
    [self.customNavBar wr_setRightButtonWithImage:[UIImage imageNamed:@"topnav_btn_sousuo999"]];

    
    
    
    vc1 = [[BookrackSubViewController alloc] init];
    vc2 = [[BookrackSubViewController alloc] init];
    vc3 = [[BookrackSubViewController alloc] init];
    vc4 = [[BookrackSubViewController alloc] init];
    vc5 = [[BookrackSubViewController alloc] init];
    vc6 = [[BookrackSubViewController alloc] init];

    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    [self addChildViewController:vc4];
    [self addChildViewController:vc5];
    [self addChildViewController:vc6];

    [self.view addSubview:self.segmentedPager];
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedPager.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : kUIColorFromRGB(0x999999),NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14]};
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : kUIColorFromRGB(0x333333),NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14]};
    self.segmentedPager.segmentedControl.selectionIndicatorHeight = 2.0f;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = kUIColorFromRGB(0x6FBBFF);
    self.segmentedPager.segmentedControl.borderType = HMSegmentedControlBorderTypeBottom;
    self.segmentedPager.segmentedControl.borderWidth = 0.0f;
    self.segmentedPager.segmentedControl.borderColor = kUIColorFromRGB(0xEEEEEE);
    //    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedPager.pager.gutterWidth = 20;
    
}
- (void)viewWillLayoutSubviews {
    CGFloat top;
    if ([WRNavigationBar isIphoneX]) {
        top = 88;
    }else{
        top = 64;
    }
    self.segmentedPager.frame = (CGRect){
        .origin.x       = 0.f,
        .origin.y       = top,
        .size.width     = SCREEN_WIDTH,
        .size.height    = SCREEN_HEIGHT - top
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
    return 6;
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    
    return [@[@"全部书籍", @"教育教科", @"文学小说", @"人文社科", @"童书绘画", @"历史文化"] objectAtIndex:index];
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
    
    return @[vc1.view, vc2.view, vc3.view, vc4.view, vc5.view, vc6.view][index];
}
- (CGFloat)heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager
{
    return 51;
}
#pragma -mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger index = (indexPath.row % 2) + 1;
    [self.segmentedPager.pager showPageAtIndex:index animated:YES];
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
