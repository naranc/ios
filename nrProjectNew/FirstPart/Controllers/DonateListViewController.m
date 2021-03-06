//
//  DonateListViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "DonateListViewController.h"
#import "DonateTableViewCell.h"
#import "DonateModel.h"
#import "DonateDetaiViewController.h"
#import "ScreenView.h"

static NSString * cellitifter = @"cellitifter";

@interface DonateListViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat kHeadMinH;
}
@property (nonatomic, strong) UITableView * listTableView;

@property (nonatomic, strong) UIImageView * donateImageView;

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@property (assign, nonatomic) CGFloat kHeadH;

@property (nonatomic, strong) UIButton * backButton;

@property (nonatomic, strong) UIButton * searchButton;

@property (nonatomic, strong) UIView * screenView;

@property (nonatomic, strong) UILabel * screenLabel;

@property (nonatomic, strong) UIButton * screenButton;

@property (nonatomic, strong) NSArray * imageTArray;

@property (nonatomic, strong) NSMutableArray *donateArray;

@property (nonatomic, strong) UIView * blackBgView;

@property (nonatomic, strong) ScreenView * sView;


@end

@implementation DonateListViewController
- (NSMutableArray *)donateArray {
    if (_donateArray == nil) {
        _donateArray = [NSMutableArray array];
    }
    return _donateArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _kHeadH = SCREEN_WIDTH * 165 / 375;
    kHeadMinH = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    [self.view addSubview:self.listTableView];
    self.visualEffectView.bounds = self.donateImageView.frame;
    [_donateImageView addSubview:_visualEffectView];
    [self.view addSubview:_donateImageView];
    
    
    [self.view addSubview:self.screenView];
    [_screenView addSubview:self.screenLabel];
    [_screenView addSubview:self.screenButton];

    
    
    [self.view addSubview:self.backButton];
    [self.view bringSubviewToFront:_backButton];
    [self.view addSubview:self.searchButton];
    [self.view bringSubviewToFront:_searchButton];
    
    
    [self.view addSubview:self.blackBgView];
    [self.view addSubview:self.sView];

    
    
    [self getDonateListData];

    
   
}
- (void)getDonateListData
{
    
    
    NSDictionary * dic = @{@"pageNum":@1,@"pageSize":@10};
    [DonateModel getDonateListWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"wishList = %@",dic);
        NSMutableArray * tempArray = [DonateModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"orders"]];
        [self.donateArray addObjectsFromArray:(NSArray*)tempArray];
        [_listTableView reloadData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];

    
}

- (UIImageView *)donateImageView
{
    if (!_donateImageView) {
        _donateImageView = [[UIImageView alloc] init];
        _donateImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 165 / 375);
        _donateImageView.image = [UIImage imageNamed:@"jzq_bj"];
        _donateImageView.contentMode = UIViewContentModeScaleAspectFill;
        _donateImageView.clipsToBounds = YES;
    }
    return _donateImageView;
}
- (UIVisualEffectView *)visualEffectView
{
    if (!_visualEffectView) {
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _visualEffectView.alpha = 0;
    }
    return _visualEffectView;
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
- (UIView *)screenView
{
    if (!_screenView) {
        _screenView = [[UIView alloc] init];
        _screenView.frame = CGRectMake(0, _donateImageView.bottom, SCREEN_WIDTH, 42);
        _screenView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _screenView;
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
    DonateModel * model;
    if (_donateArray.count) {
        model = _donateArray[indexPath.row];
    }
    DonateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[DonateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _donateArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonateModel * model = _donateArray[indexPath.row];
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
//    return 10 + 15 + 40 + 12 + 20 + 8  + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 15;
    return 16 + 40 + 12 + 20 + 8 + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 45 + 12;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonateModel * model;
    if (_donateArray.count) {
        model = _donateArray[indexPath.row];
        DonateDetaiViewController * donateVC = [[DonateDetaiViewController alloc] init];
        donateVC.donateModel = model;
        [self.navigationController pushViewController:donateVC animated:YES];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat beginOffsetY = -_kHeadH - 42;
    CGFloat offsetY = scrollView.contentOffset.y - beginOffsetY;
    //所以
    CGFloat height = _kHeadH - offsetY;
    //当向上拖动的时候，头视图会越来越小，为了让选项卡，能够停留在导航栏下方。需要设置图片的最小高度是64。
    if (height < kHeadMinH) {
        height = kHeadMinH;
    }
    self.donateImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    _screenView.frame = CGRectMake(0, _donateImageView.bottom, SCREEN_WIDTH, 42);
    self.visualEffectView.frame = self.donateImageView.bounds;
    
    // 设置导航条的透明度
    CGFloat alpha = offsetY / (_kHeadH - kHeadMinH);
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
