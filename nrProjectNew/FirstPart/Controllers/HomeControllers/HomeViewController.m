//
//  HomeViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/2.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "HomeViewController.h"
#import "CollectionTableViewCell.h"
#import "SDCycleScrollView.h"
#import "HomeTableViewCell.h"
#import "GYRollingNoticeView.h"
#import "TypeView.h"
#import "WRImageHelper.h"
#import "BookstoreViewController.h"
#import "SearchBookViewController.h"
#import "RecommendListViewController.h"
#import "AidViewController.h"
#import "SubjectViewController.h"
#import "PRankingViewController.h"
#import "SearchTagsViewController.h"
#import "BookDetailViewController.h"
#define FLASHVIEWHEIGHT SCREEN_WIDTH*200/375
#define HEADVIEWHEIGHT 800

//#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

static NSString * cellitifter00 = @"cellitifter00";

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource,SDCycleScrollViewDelegate,GYRollingNoticeViewDataSource, GYRollingNoticeViewDelegate,CollectionTableViewCelllDelegate,TypeViewDelegate>
{
    NSArray *_arr1;
    GYRollingNoticeView *_noticeView1;
    CollectionTableViewCell * cell;
}
@property (nonatomic, strong)UITableView * foundTableView;

@property (nonatomic, strong)UIView * searchView;

@property (nonatomic, strong)UIView * searchBGView;

@property (nonatomic, strong)UIView * headerView;

@property (nonatomic, strong)UIView * footerView;

@property (nonatomic, strong)UIView * noticeBgView;

@property (nonatomic, strong)UIImageView * noticeImageView;

@property (nonatomic, strong)SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong)TypeView * typeView;

@property (nonatomic, strong)NSMutableArray *imageArray;

@property (nonatomic, strong)ImageTextButton *searchBar;

@end

@implementation HomeViewController
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customNavBar.hidden = YES;
    
    
    [self.imageArray addObject:@"banner"];
    [self.imageArray addObject:@"banner"];
    [self.imageArray addObject:@"banner"];
    [self.imageArray addObject:@"banner"];
    [self.imageArray addObject:@"banner"];

    
    _arr1 = @[@"那然公益一些资讯在资讯在在资这里…",
              @"那然公益一些资讯在资讯在在资这里…",
              @"那然公益一些资讯在资讯在在资这里…",
              @"那然公益一些资讯在资讯在在资这里…",
              @"那然公益一些资讯在资讯在在资这里…"
              ];
    
    
    [self.view addSubview:self.foundTableView];
    
    
    [self.headerView addSubview:self.cycleScrollView];
    
    [_headerView addSubview:self.noticeBgView];
    
    [_headerView addSubview:self.noticeImageView];
    
    [self creatRollingViewWithArray:_arr1];

    
    cell = [[CollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.delegate = self;
    cell.frame = CGRectMake(0, _noticeBgView.bottom + 24, SCREEN_WIDTH, 58+17);
    
    [_headerView addSubview:cell];
    [_headerView addSubview:self.typeView];

    _foundTableView.tableHeaderView = _headerView;
    _foundTableView.tableFooterView = self.footerView;
    
    [self.view addSubview:self.searchView];
    
    
    
    if ([WRNavigationBar isIphoneX]) {
        self.searchBar.frame = CGRectMake(13, 0, SCREEN_WIDTH - 60 - 13, 34);
    }else{
        self.searchBar.frame = CGRectMake(13, 0, SCREEN_WIDTH - 60 - 13, 34);
    }
    
    [self.view addSubview:self.searchBGView];
    [_searchBGView addSubview:_searchBar];

}
- (void)clickType:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        RecommendListViewController * recommentVC = [[RecommendListViewController alloc] init];
        recommentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:recommentVC animated:YES];
    }else if (indexPath.row == 1){
        AidViewController * aidVC = [[AidViewController alloc] init];
        aidVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aidVC animated:YES];
    }else if (indexPath.row == 2){
        SubjectViewController * subjectVC = [[SubjectViewController alloc] init];
        subjectVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:subjectVC animated:YES];
    }else{
        PRankingViewController * prankVC = [[PRankingViewController alloc] init];
        prankVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:prankVC animated:YES];
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"offsetY = %f",offsetY);
    if (offsetY <= 0) {
        _searchView.alpha = 0;
    }

    if (offsetY<0) {
        _searchBGView.alpha = 0;
        _searchBar.alpha = 0;
    }else{
        _searchBGView.alpha = 1;
        _searchBar.alpha = 1;
    }
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

    if (offsetY > 0)
    {
        if (offsetY < FLASHVIEWHEIGHT) {
            CGFloat alpha = offsetY / (FLASHVIEWHEIGHT-top);
            _searchView.alpha = alpha;
        }
    }
//    //限制下拉的距离
//    if(offsetY < LIMIT_OFFSET_Y) {
//        [scrollView setContentOffset:CGPointMake(0, LIMIT_OFFSET_Y)];
//    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_noticeView1.timer invalidate];
}

- (void)creatRollingViewWithArray:(NSArray *)arr
{
    CGRect frame = CGRectMake(82, 0, _noticeBgView.width - 82 - 29, 33);
    GYRollingNoticeView *noticeView = [[GYRollingNoticeView alloc]initWithFrame:frame];
    noticeView.dataSource = self;
    noticeView.delegate = self;
    [_noticeBgView addSubview:noticeView];
    noticeView.backgroundColor = [UIColor lightGrayColor];
    
    _noticeView1 = noticeView;
    
    [noticeView registerClass:[GYNoticeViewCell class] forCellReuseIdentifier:@"GYNoticeViewCell"];
    
    [noticeView beginScroll];
}



- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView
{
    return _arr1.count;
}
- (__kindof GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    // 普通用法，只有一行label滚动显示文字
    // normal use, only one line label rolling
    GYNoticeViewCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"GYNoticeViewCell"];
    cell.textLabel.text = _arr1[index];
    cell.contentView.backgroundColor = kUIColorFromRGB(0xF4F4F4);
    return cell;
}

- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index
{
    NSLog(@"点击的index: %d", index);
}
- (UIView *)searchView
{
    if (!_searchView) {
        _searchView = [[UIView alloc] init];
        _searchView.backgroundColor = kUIColorFromRGB(0x65BCFF);
        _searchView.alpha = 0;
        if ([WRNavigationBar isIphoneX]) {
            _searchView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 88);
        } else {
            _searchView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        }
    }
    return _searchView;
}

- (UIView *)searchBGView
{
    if (!_searchBGView) {
        _searchBGView = [[UIView alloc] init];
        if ([WRNavigationBar isIphoneX]) {
            _searchBGView.frame = CGRectMake(30, 40, SCREEN_WIDTH - 60, 34);
        }else{
            _searchBGView.frame = CGRectMake(30, 22, SCREEN_WIDTH - 60, 34);
        }
        _searchBGView.backgroundColor = kUIColorFromRGB(0xE7E7E7);
        _searchBGView.layer.cornerRadius = 4.0f;
        _searchBGView.clipsToBounds = YES;
    }
    return _searchBGView;
}
- (ImageTextButton *)searchBar
{
    if (!_searchBar) {
        _searchBar = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _searchBar.midSpacing = 8;
        _searchBar.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _searchBar.imageSize = CGSizeMake(15, 15);
        [_searchBar setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _searchBar.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_searchBar setTitle:@"搜索你感兴趣的" forState:UIControlStateNormal];
        _searchBar.backgroundColor = kUIColorFromRGB(0xE7E7E7);
        [_searchBar setImage:[UIImage imageNamed:@"index_sousuo"] forState:UIControlStateNormal];
        weakify(self);
        [_searchBar addAction:^(UIButton *btn) {
//            SearchTagsViewController * searchVC = [[SearchTagsViewController alloc] init];
//            [weakSelf presentViewController:searchVC animated:YES completion:nil];
            SearchTagsViewController * searchVC = [[SearchTagsViewController alloc] init];
            UINavigationController *ANavigationController = [[UINavigationController alloc] initWithRootViewController:searchVC];
            [weakSelf.navigationController presentViewController:ANavigationController animated:YES completion:nil];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBar;
    
}
- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, FLASHVIEWHEIGHT + 490);
    }
    return _headerView;
}
- (UIView *)footerView
{
    if (!_footerView) {
        _footerView = [[UIView alloc] init];
        _footerView.backgroundColor = [UIColor clearColor];
        _footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 16);
    }
    return _footerView;
}
- (UIView *)noticeBgView
{
    if (!_noticeBgView) {
        _noticeBgView = [[UIView alloc] init];
        _noticeBgView.backgroundColor = kUIColorFromRGB(0xF4F4F4);
        _noticeBgView.frame = CGRectMake(30, _cycleScrollView.bottom + 17, SCREEN_WIDTH - 60, 33);
        _noticeBgView.layer.cornerRadius = 33/2;
        _noticeBgView.clipsToBounds = YES;
    }
    return _noticeBgView;
}

- (UIImageView *)noticeImageView
{
    if (!_noticeImageView) {
        _noticeImageView = [[UIImageView alloc] init];
        _noticeImageView.frame = CGRectMake(55, _cycleScrollView.bottom, 42, 51);
        _noticeImageView.image = [UIImage imageNamed:@"xinyuankuaibao"];
    }
    return _noticeImageView;
}
- (TypeView *)typeView
{
    if (!_typeView) {
        _typeView = [[TypeView alloc] initWithFrame:CGRectMake(0, cell.bottom + 24, SCREEN_WIDTH, 317)];
        _typeView.delegate = self;
    }
    return _typeView;
}
//爱心书屋
- (void)clickBookStore
{
    BookstoreViewController * bookVC = [[BookstoreViewController alloc] init];
    bookVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:bookVC animated:YES];
}
- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [[SDCycleScrollView alloc] init];
        _cycleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, FLASHVIEWHEIGHT);
        _cycleScrollView.delegate = self;
        _cycleScrollView.placeholderImage =[UIImage imageNamed:@"firstBannerImage"];
        _cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"roll1"];//当前圆点的image
        _cycleScrollView.pageDotImage = [UIImage imageNamed:@"roll"];//滑过的圆点的image
        _cycleScrollView.pageControlDotSize = CGSizeMake(10, 10);
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        //kDefaultSpacingBetweenDots    dots 间距
    }
    _cycleScrollView.imageURLStringsGroup = (NSArray*)self.imageArray;
    return _cycleScrollView;
}
- (UITableView *)foundTableView
{
    if (!_foundTableView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - self.tabBarController.tabBar.height);
        _foundTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _foundTableView.delegate = self;
        _foundTableView.dataSource = self;
        _foundTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _foundTableView.showsVerticalScrollIndicator = NO;
        _foundTableView.backgroundColor = [UIColor whiteColor];
        _foundTableView.estimatedRowHeight = 0;
        _foundTableView.estimatedSectionHeaderHeight = 0;
        _foundTableView.estimatedSectionFooterHeight = 0;
    }
    return _foundTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter00];
    if (!cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter00];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell bookDetailViewConfigCellWithModel:nil indexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 144 + 16;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BookDetailViewController * bookDetailVC = [[BookDetailViewController alloc] init];
    bookDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:bookDetailVC animated:YES];
}
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
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
