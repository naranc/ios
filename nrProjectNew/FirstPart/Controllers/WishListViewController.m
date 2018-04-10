//
//  WishListViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "WishListViewController.h"
#import "WishListTableViewCell.h"
#import "WishDetailViewController.h"
#import "WishModel.h"
#import "ScreenView.h"
static NSString * cellitifter = @"cellitifter";

@interface WishListViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat kHeadMinH;
    CGFloat cellHeight;

}
@property (nonatomic, strong) UITableView * listTableView;

@property (nonatomic, strong) NSMutableArray * wishListArray;

@property (nonatomic, strong) UIImageView * wishImageView;

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@property (nonatomic ,assign) CGFloat kHeadH;

@property (nonatomic, strong) UIButton * backButton;

@property (nonatomic, strong) UIButton * searchButton;

@property (nonatomic, strong) UIView * screenView;

@property (nonatomic, strong) UILabel * screenLabel;

@property (nonatomic, strong) UIButton * screenButton;

@property (nonatomic, strong) UIView * blackBgView;

@property (nonatomic, strong) ScreenView * sView;

@end

@implementation WishListViewController
- (NSMutableArray *)wishListArray
{
    if (!_wishListArray) {
        _wishListArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _wishListArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    cellHeight = (SCREEN_WIDTH - 30) * 238 / 345 + 60 + 12 + 16;
    _kHeadH = SCREEN_WIDTH * 165 / 375;
    kHeadMinH = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    [self.view addSubview:self.listTableView];

    
    self.visualEffectView.bounds = self.wishImageView.frame;
    [_wishImageView addSubview:_visualEffectView];
    [self.view addSubview:_wishImageView];
    
    [self.view addSubview:self.screenView];
    [_screenView addSubview:self.screenLabel];
    [_screenView addSubview:self.screenButton];
    
    
    [self.view addSubview:self.backButton];
    [self.view bringSubviewToFront:_backButton];
    [self.view addSubview:self.searchButton];
    [self.view bringSubviewToFront:_searchButton];
    
    
    
    [self.view addSubview:self.blackBgView];
    [self.view addSubview:self.sView];
    

    [self getWishListData];
}
- (void)getWishListData
{
    NSDictionary * dic = @{@"pageNum":@1,@"pageSize":@10};
    [WishModel getWishListWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"wishList = %@",dic);
        NSMutableArray * tempArray = [WishModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"orders"]];
        [self.wishListArray addObjectsFromArray:(NSArray*)tempArray];
        [_listTableView reloadData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(5, kHeadMinH - 40, 40, 40);
        [_backButton setImage:[UIImage imageNamed:@"wihte_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
- (void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UIButton *)searchButton
{
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 24, kHeadMinH - 40, 24, 40);
        [_searchButton setImage:[UIImage imageNamed:@"topnav_btn_sousuo"] forState:UIControlStateNormal];
        [_searchButton addTarget:self action:@selector(searchButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}
- (void)searchButton:(UIButton *)btn
{
    
}
- (UIImageView *)wishImageView
{
    if (!_wishImageView) {
        _wishImageView = [[UIImageView alloc] init];
        _wishImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _kHeadH);
        _wishImageView.contentMode = UIViewContentModeScaleAspectFill;
        _wishImageView.clipsToBounds = YES;
        _wishImageView.image = [UIImage imageNamed:@"xyq_bj"];
    }
    return _wishImageView;
}
- (UIVisualEffectView *)visualEffectView
{
    if (!_visualEffectView) {
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _visualEffectView.alpha = 0;
    }
    return _visualEffectView;
}
- (UIView *)screenView
{
    if (!_screenView) {
        _screenView = [[UIView alloc] init];
        _screenView.frame = CGRectMake(0, _wishImageView.bottom, SCREEN_WIDTH, 42);
        _screenView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _screenView;
}
- (ScreenView *)sView
{
    if (!_sView) {
        _sView = [[ScreenView alloc] init];
        _sView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH - 89, SCREEN_HEIGHT);
        _sView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _sView;
}
- (UIView *)blackBgView
{
    if (!_blackBgView) {
        _blackBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _blackBgView.hidden = YES;
        _blackBgView.userInteractionEnabled = YES;
        _blackBgView.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.5);
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction)];
        [_blackBgView addGestureRecognizer:singleTap];
    }
    return _blackBgView;
}
- (void)tapImageAction
{
    _blackBgView.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        _sView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH - 89, SCREEN_HEIGHT);
    }];
}
- (UILabel *)screenLabel
{
    if (!_screenLabel) {
        _screenLabel = [[UILabel alloc] init];
        _screenLabel.frame = CGRectMake(15, 0, 50, 42);
        _screenLabel.text = @"最新";
        _screenLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _screenLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _screenLabel;
}

- (UIButton *)screenButton
{
    if (!_screenButton) {
        _screenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _screenButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 30, 0, 30, 42);
        [_screenButton setTitle:@"筛选" forState:UIControlStateNormal];
        _screenButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        [_screenButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_screenButton addAction:^(UIButton *btn) {
            _blackBgView.hidden = NO;
            [UIView animateWithDuration:0.3 animations:^{
                _sView.frame = CGRectMake(89, 0, SCREEN_WIDTH - 89, SCREEN_HEIGHT);
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _screenButton;
}
- (UITableView *)listTableView
{
    if (!_listTableView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _listTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _listTableView.estimatedRowHeight = 0;
        _listTableView.estimatedSectionHeaderHeight = 0;
        _listTableView.estimatedSectionFooterHeight = 0;
        _listTableView.autoresizesSubviews = YES;
        _listTableView.contentInset = UIEdgeInsetsMake(_kHeadH + 42, 0, 0, 0);
    }
    return _listTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WishModel * model;
    if (_wishListArray.count) {
        model = _wishListArray[indexPath.row];
    }
    WishListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[WishListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _wishListArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WishModel * model;
    if (_wishListArray.count) {
        model = _wishListArray[indexPath.row];
        WishDetailViewController * wishDetailVC = [[WishDetailViewController alloc] init];
        wishDetailVC.wishModel = model;
        [self.navigationController pushViewController:wishDetailVC animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat beginOffsetY = -_kHeadH - 42;
    CGFloat offsetY = scrollView.contentOffset.y - beginOffsetY;
    //所以
    CGFloat height = _kHeadH - offsetY;
    //当向上拖动的时候，头视图会越来越小，为了让选项卡，能够停留在导航栏下方。需要设置图片的最小高度是64。
    if (height < kHeadMinH) {
        height = kHeadMinH;
    }
    self.wishImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    _screenView.frame = CGRectMake(0, _wishImageView.bottom, SCREEN_WIDTH, 42);
    self.visualEffectView.frame = self.wishImageView.bounds;
    
    // 设置导航条的透明度
    CGFloat alpha = offsetY / (_kHeadH + 42 - kHeadMinH);
    if (alpha >= 1) {
        alpha = 1;
    }
    self.visualEffectView.alpha = alpha;
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
