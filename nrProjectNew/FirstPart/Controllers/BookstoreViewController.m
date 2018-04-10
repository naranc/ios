//
//  BookstoreViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookstoreViewController.h"
static NSString * cellitifter = @"cellitifter";

@interface BookstoreViewController ()<UITableViewDelegate, UITableViewDataSource>

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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
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
