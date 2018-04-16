//
//  BookwormViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookwormViewController.h"
#import <MXSegmentedPager/MXSegmentedPager.h>
#import "DonateBookTableViewController.h"
#import "ReadRackTableViewController.h"
#import "BookReviewTableViewController.h"
#import "BookRackView.h"

#define textFont [UIFont fontWithName:@"PingFangSC-Regular" size:10.5]
#define labelTextColor kUIColorFromRGB(0x999999)

@interface BookwormViewController ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource>
{
    DonateBookTableViewController *vc1;
    ReadRackTableViewController *vc2;
    BookReviewTableViewController *vc3;
}

@property (nonatomic, strong) MXSegmentedPager * segmentedPager;

@property (nonatomic, strong) BookRackView * footerView;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) UILabel * userRankeingL;

@property (nonatomic, strong) UILabel * markLabel;

@end

@implementation BookwormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"书虫榜"];
    self.view.backgroundColor = kUIColorFromRGB(0xffffff);
    vc1 = [[DonateBookTableViewController alloc] init];
    vc2 = [[ReadRackTableViewController alloc] init];
    vc3 = [[BookReviewTableViewController alloc] init];
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
    
    [self.view addSubview:self.footerView];
    [self.view addSubview:self.headView];
    [_headView addSubview:self.userRankeingL];
    [_headView addSubview:self.markLabel];
    _userRankeingL.text = @"排名";
    _markLabel.text = @"数量";
    
    
    
    _footerView.markImageView.image = [UIImage imageNamed:@"gyb_tongpai"];
    _footerView.userNickNameLabel.text = @"逆水行舟";
    _footerView.numberLabel.text = @"256";
    _footerView.userImageView.image = [UIImage imageNamed:@"userimagePic.jpg"];
    _footerView.contentLabel.text = @"这个人很懒,什么都没留下。";
    
    
    
    

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
    
    return [@[@"赠书榜", @"读书榜", @"书评榜"] objectAtIndex:index];
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
    
    return @[vc1.view, vc2.view, vc3.view][index];
}
- (CGFloat)heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager
{
    return 47;
}

- (BookRackView *)footerView
{
    if (!_footerView) {
        _footerView = [[BookRackView alloc] init];
        _footerView.frame = CGRectMake(0, SCREEN_HEIGHT - 74, SCREEN_WIDTH, 74);
    }
    return _footerView;
}
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

        _headView.frame = CGRectMake(0, top + 47, SCREEN_WIDTH, 28);
        _headView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _headView;
}
- (UILabel *)userRankeingL
{
    if (!_userRankeingL) {
        _userRankeingL = [[UILabel alloc] init];
        _userRankeingL.frame = CGRectMake(15, 0, 50, 28);
        _userRankeingL.font = textFont;
        _userRankeingL.textColor = labelTextColor;
    }
    return _userRankeingL;
}
- (UILabel *)markLabel
{
    if (!_markLabel) {
        _markLabel = [[UILabel alloc] init];
        _markLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - 50, 0, 50, 28);
        _markLabel.textAlignment = NSTextAlignmentRight;
        _markLabel.font = textFont;
        _markLabel.textColor = labelTextColor;
    }
    return _markLabel;
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
