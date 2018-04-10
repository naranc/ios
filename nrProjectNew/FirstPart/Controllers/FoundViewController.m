//
//  FoundViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/18.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "FoundViewController.h"
#import "CycleTableViewCell.h"
#import "AdvertisTableViewCell.h"
#import "CollectionTableViewCell.h"
#import "WallTableViewCell.h"
#import "DonateTableViewCell.h"
#import "DonateModel.h"
#import "GlobalSingleton.h"
#import "RecommendListViewController.h"
#import "AidViewController.h"
#import "SubjectViewController.h"
#import "PRankingViewController.h"
#import "WishListViewController.h"
#import "DonateListViewController.h"
#import "NewPublishTableViewCell.h"

static NSString * cellitifter00 = @"cellitifter00";
static NSString * cellitifter01 = @"cellitifter01";
static NSString * cellitifter02 = @"cellitifter02";
static NSString * cellitifter03 = @"cellitifter03";
static NSString * cellitifter04 = @"cellitifter04";
static NSString * cellitifter10 = @"cellitifter10";

@interface FoundViewController ()<UITableViewDelegate, UITableViewDataSource,CollectionTableViewCelllDelegate>

@property (nonatomic, strong)UITableView * foundTableView;

@property (nonatomic, strong) NSMutableArray *imageArray;

@property (nonatomic, strong) NSArray * titleArray;

@property (nonatomic, strong) NSArray * imageTArray;

@property (nonatomic, strong) NSMutableArray *dynamicArray;

@end

@implementation FoundViewController
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (NSMutableArray *)dynamicArray {
    if (_dynamicArray == nil) {
        _dynamicArray = [NSMutableArray array];
    }
    return _dynamicArray;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CycleTableViewCell * cell;
    if (!cell) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        cell = [_foundTableView cellForRowAtIndexPath:indexPath];
    }
    [cell adjustCenterSubview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    for (int index = 0; index < 5; index++) {
        UIImage *image = [UIImage imageNamed:@"xhdpibanner.png"];
        [self.imageArray addObject:image];
    }
    
    _titleArray = @[@" 那然公益一些资讯在资讯在资讯在这里这…",@" 那然公益一些资讯在资讯在资讯在这里这…",@" 那然公益一些资讯在资讯在资讯在这里这…",@" 那然公益一些资讯在资讯在资讯在这里这…"];
    [self.view addSubview:self.foundTableView];

    
    weakify(self);
  
    [_foundTableView bindRefreshStyle:3 fillColor:MainColor atPosition:KafkaRefreshPositionHeader refreshHanler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.foundTableView.headRefreshControl endRefreshing];
        });
    }];
    
    
    
    
    
    
    
    
    DonateModel * donate = [[DonateModel alloc] init];
    donate.createTime = @"2018-01-09 12:02:33";
    donate.initiatorId = @4;
    donate.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    donate.initiatorNike = @"156****7367";
    donate.orderContent = @"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据";
    donate.orderId = @8;
    donate.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/1515470546947_682.jpg";
    donate.orderTitle = @"测试数据测试数据测试数据测试数据";
    donate.orderType = @"DONATION";
    donate.typeName = @"捐赠";
    donate.updateTime = @"2018-01-09 20:03:20";
    
    
    
    DonateModel * donate1 = [[DonateModel alloc] init];
    donate1.createTime = @"2018-01-09 12:02:33";
    donate1.initiatorId = @4;
    donate1.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    donate1.initiatorNike = @"156****7367";
    donate1.orderContent = @"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111";
    donate1.orderId = @8;
    donate1.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/1515418600120_335.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600121_742.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600121_874.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600122_132.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600122_363.jpg";
    donate1.orderTitle = @"测试数据测试数据测试数据测试数据测试数据测试数据";
    donate1.orderType = @"DONATION";
    donate1.typeName = @"捐赠";
    donate1.updateTime = @"2018-01-09 20:03:20";
    
    DonateModel * donate2 = [[DonateModel alloc] init];
    donate2.createTime = @"2018-01-09 12:02:33";
    donate2.initiatorId = @4;
    donate2.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    donate2.initiatorNike = @"156****7367";
    donate2.orderContent = @"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据222";
    donate2.orderId = @8;
    donate2.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png";
    donate2.orderTitle = @"测试数据";
    donate2.orderType = @"DONATION";
    donate2.typeName = @"捐赠";
    donate2.updateTime = @"2018-01-09 20:03:20";
    
    
    
    
    [self.dynamicArray addObject:donate];
    [self.dynamicArray addObject:donate1];
    [self.dynamicArray addObject:donate2];
    
    
    
    
    
    [_foundTableView reloadData];


}

- (UITableView *)foundTableView
{
    if (!_foundTableView) {
        CGFloat top;
        if ([WRNavigationBar isIphoneX]) {
            top = 40;
        }else{
            top = 25;
        }
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - top - 32 - self.tabBarController.tabBar.height);
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
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            CycleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter00];
            if (!cell) {
                cell = [[CycleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter00];
            }
            [cell configDataWithArtray:_imageArray];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.backgroundColor = [UIColor grayColor];

            return cell;
        }else if (indexPath.row == 1){
            AdvertisTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter01];
            if (!cell) {
                cell = [[AdvertisTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter01];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.backgroundColor = MainColor;
            [cell setUpJDRollingWithArtray:_titleArray];
            return cell;
        }else if (indexPath.row == 2){
            WallTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter02];
            if (!cell) {
                cell = [[WallTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter02];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.onClickWishImageButton = ^{
                WishListViewController * wishVC = [[WishListViewController alloc] init];
                wishVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:wishVC animated:YES];
            };
            cell.onClickDonateImageButton = ^{
                DonateListViewController * donateVC = [[DonateListViewController alloc] init];
                donateVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:donateVC animated:YES];
            };
            return cell;
        }else if (indexPath.row == 3){
            CollectionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter03];
            if (!cell) {
                cell = [[CollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter03];
            }
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            NewPublishTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter04];
            if (!cell) {
                cell = [[NewPublishTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter04];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else{
        
        DonateModel * model;
        if (_dynamicArray.count) {
            model = _dynamicArray[indexPath.row];
        }
        DonateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter10];
        if (!cell) {
            cell = [[DonateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter10];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell configCellWithModel:model indexPath:indexPath];
        return cell;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else{
        return _dynamicArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return (SCREEN_WIDTH - 60) * 157 / 311 + 18;
        }else if (indexPath.row == 1){
            return 35;
        }else if (indexPath.row == 2){
            return (SCREEN_WIDTH - 29 - 29 - 27) / 2 * 208 / 322 + 16;
        }else if (indexPath.row == 3){
            return 90;
        }else{
            return 50;
        }
    }else{
        
        DonateModel * model = _dynamicArray[indexPath.row];
        CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
//        return 10 + 15 + 40 + 12 + 20 + 8  + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 15;
        return 16 + 40 + 12 + 20 + 8 + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 45 + 12;

    }
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
