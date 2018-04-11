//
//  BookstoreViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookstoreViewController.h"
#import "WishListTableViewCell.h"
#import "WishDetailViewController.h"
#import "WishModel.h"
#import "KafkaArrowHeader.h"
static NSString * cellitifter = @"cellitifter";

@interface BookstoreViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat kHeadMinH;
    
}
@property (nonatomic, strong) UITableView * listTableView;


@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@property (nonatomic, strong) NSMutableArray * wishListArray;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@property (nonatomic ,assign) CGFloat kHeadH;

@property (nonatomic, strong) UIButton * backButton;

@property (nonatomic, strong) UIButton * searchButton;



@property (nonatomic, strong)UITableView * bookTableView;

@property (nonatomic, strong)UIView * topBgView;;

@end

@implementation BookstoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.customNavBar.frame;  // 设置显示的frame
    gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
    //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    gradientLayer.endPoint = CGPointMake(1, 0);     //
    [self.customNavBar.layer addSublayer:gradientLayer];

    [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"nav_back"]];
    [self.customNavBar wr_setRightButtonWithImage:[UIImage imageNamed:@"topnav_btn_sousuo999"]];
    [self.customNavBar setTitle:@"爱的书屋"];
    [self.customNavBar setTitleLabelFont:[UIFont fontWithName:@"PingFangSC-Medium" size:17]];
    [self.customNavBar setTitleLabelColor:kUIColorFromRGB(0xFFFFFF)];
    [self.customNavBar wr_setSubViewToFront];


    [self.view addSubview:self.bookTableView];
    
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
//    _bookTableView.backgroundColor = [UIColor redColor];
    
    
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = self.bookTableView.frame;  // 设置显示的frame
    gradientLayer1.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
    //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
    gradientLayer1.startPoint = CGPointMake(0, 0);   //
    gradientLayer1.endPoint = CGPointMake(1, 0);     //
    
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
//    view.contentMode = UIViewContentModeScaleAspectFill;
//    view.clipsToBounds = YES;
    view.image = [UIImage imageNamed:@"TREST1111.png"];
//    view.backgroundColor = [UIColor redColor];
//    [_bookTableView.layer addSublayer:gradientLayer1];
    self.bookTableView.backgroundView = view;
//    self.bookTableView.backgroundColor = [UIColor whiteColor];
//      [self.bookTableView bringSubviewToFront:_bookTableView];
    
    
    
//    weakify(self);
//
//    weakSelf.bookTableView.headRefreshControl.backgroundColor = [UIColor clearColor];
//    [_bookTableView bindRefreshStyle:3 fillColor:[UIColor whiteColor] atPosition:KafkaRefreshPositionHeader refreshHanler:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            [weakSelf.bookTableView.headRefreshControl endRefreshing];
//        });
//    }];

    
    weakify(self);
    KafkaArrowHeader * arrow = [[KafkaArrowHeader alloc] init];
    arrow.fillColor = [UIColor whiteColor];
    arrow.backgroundColor = [UIColor clearColor];
//    arrow.re
    arrow.refreshHandler = ^{
        //.....
        [self.bookTableView.headRefreshControl endRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.bookTableView.headRefreshControl endRefreshing];
        });
    };
//    self.bookTableView.headRefreshControl.
//    self.bookTableView.headRefreshControl.
    self.bookTableView.headRefreshControl = arrow;
    
    
//    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
//    _kHeadH = top + 80;
//    kHeadMinH = ([WRNavigationBar isIphoneX]) ? 88 : 64;
//
//    [self.view addSubview:self.listTableView];
//
//
//    self.visualEffectView.bounds = self.headView.frame;
//    [_headView addSubview:_visualEffectView];
//    [self.view addSubview:_headView];
//
//
//
//
//    [self.view addSubview:self.backButton];
//    [self.view bringSubviewToFront:_backButton];
//    [self.view addSubview:self.searchButton];
//    [self.view bringSubviewToFront:_searchButton];
//
    
    

    
    
//    [self getWishListData];
    
    
}
- (UIView *)topBgView
{
    if (!_topBgView) {
        _topBgView = [[UIView alloc] init];
        _topBgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _topBgView.frame;  // 设置显示的frame
        gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
        //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
        gradientLayer.startPoint = CGPointMake(0, 0);   //
        gradientLayer.endPoint = CGPointMake(1, 0);     //
        [_topBgView.layer addSublayer:gradientLayer];
    }
    return _topBgView;
}
- (UITableView *)bookTableView
{
    if (!_bookTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _bookTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _bookTableView.delegate = self;
        _bookTableView.dataSource = self;
        _bookTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bookTableView.showsVerticalScrollIndicator = NO;
        _bookTableView.backgroundColor = [UIColor whiteColor];
        _bookTableView.estimatedRowHeight = 0;
        _bookTableView.estimatedSectionHeaderHeight = 0;
        _bookTableView.estimatedSectionFooterHeight = 0;
    }
    return _bookTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell bookDetailViewConfigCellWithModel:nil indexPath:indexPath];
        [cell addSubview:self.topBgView];
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell bookDetailViewConfigCellWithModel:nil indexPath:indexPath];
        return cell;
    }


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
//- (void)getWishListData
//{
//    NSDictionary * dic = @{@"pageNum":@1,@"pageSize":@10};
//    [WishModel getWishListWithParament:dic success:^(NSDictionary *dic) {
//        NSLog(@"wishList = %@",dic);
//        NSMutableArray * tempArray = [WishModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"orders"]];
//        [self.wishListArray addObjectsFromArray:(NSArray*)tempArray];
//        [_listTableView reloadData];
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
//}
//
//- (UIButton *)backButton
//{
//    if (!_backButton) {
//        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _backButton.frame = CGRectMake(5, kHeadMinH - 40, 40, 40);
//        [_backButton setImage:[UIImage imageNamed:@"wihte_back"] forState:UIControlStateNormal];
//        [_backButton addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _backButton;
//}
//- (void)goback
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//- (UIButton *)searchButton
//{
//    if (!_searchButton) {
//        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _searchButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 24, kHeadMinH - 40, 24, 40);
//        [_searchButton setImage:[UIImage imageNamed:@"topnav_btn_sousuo"] forState:UIControlStateNormal];
//        [_searchButton addTarget:self action:@selector(searchButton:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _searchButton;
//}
//- (void)searchButton:(UIButton *)btn
//{
//
//}
//- (UIView *)headView
//{
//    if (!_headView) {
//        _headView = [[UIImageView alloc] init];
//        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _kHeadH);
////        _wishImageView.contentMode = UIViewContentModeScaleAspectFill;
////        _wishImageView.clipsToBounds = YES;
////        _wishImageView.image = [UIImage imageNamed:@"xyq_bj"];
//
//
//
//            self.gradientLayer = [CAGradientLayer layer];
//            _gradientLayer.frame = _headView.frame;  // 设置显示的frame
//            _gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
//            //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
//            _gradientLayer.startPoint = CGPointMake(0, 0);   //
//            _gradientLayer.endPoint = CGPointMake(1, 0);     //
//            [_headView.layer addSublayer:_gradientLayer];
//
//
//    }
//    return _headView;
//}
//- (UIVisualEffectView *)visualEffectView
//{
//    if (!_visualEffectView) {
//        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
//        _visualEffectView.alpha = 0;
//    }
//    return _visualEffectView;
//}
//
//
//- (UITableView *)listTableView
//{
//    if (!_listTableView) {
//        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        _listTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
//        _listTableView.delegate = self;
//        _listTableView.dataSource = self;
//        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _listTableView.showsVerticalScrollIndicator = NO;
//        _listTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
//        _listTableView.estimatedRowHeight = 0;
//        _listTableView.estimatedSectionHeaderHeight = 0;
//        _listTableView.estimatedSectionFooterHeight = 0;
//        _listTableView.autoresizesSubviews = YES;
//        _listTableView.contentInset = UIEdgeInsetsMake(_kHeadH, 0, 0, 0);
//    }
//    return _listTableView;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
//    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 4;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 200;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat beginOffsetY = -_kHeadH;
    CGFloat offsetY = scrollView.contentOffset.y - beginOffsetY;
    //所以
    CGFloat height = _kHeadH - offsetY;
    //当向上拖动的时候，头视图会越来越小，为了让选项卡，能够停留在导航栏下方。需要设置图片的最小高度是64。
    if (height < kHeadMinH) {
        height = kHeadMinH;
    }
//    _gradientLayer.frame = _headView.bounds;  // 设置显示的frame
//
//    _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
//    _gradientLayer.frame = _headView.bounds;  // 设置显示的frame

//    _screenView.frame = CGRectMake(0, _wishImageView.bottom, SCREEN_WIDTH, 42);
//    self.visualEffectView.frame = self.headView.bounds;
    // 设置导航条的透明度
    CGFloat alpha = offsetY / (_kHeadH + 42 - kHeadMinH);
    if (alpha >= 1) {
        alpha = 1;
    }
//    self.visualEffectView.alpha = alpha;
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
