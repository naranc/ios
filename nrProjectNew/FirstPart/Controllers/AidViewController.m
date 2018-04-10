//
//  AidViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AidViewController.h"
#import "AidTableViewCell.h"
#import "AidModel.h"
#import "AidDetailViewController.h"

static NSString * cellitifter = @"cellitifter";

@interface AidViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * aidTableView;

@property (nonatomic, strong)NSMutableArray * aidArray;

@end

@implementation AidViewController
- (NSMutableArray *)aidArray
{
    if (!_aidArray) {
        _aidArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _aidArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //援助
    [self.customNavBar setTitle:@"援助任务"];

    [self.view addSubview:self.aidTableView];

    [self getAidDta];
}
- (void)getAidDta
{
    NSDictionary * parament = @{@"pageNum":@1,@"pageSize":@10};
    [AidModel getAidDtataWithParament:parament success:^(NSDictionary *dic) {
        NSLog(@"aidDic = %@",dic);
        NSArray * tempArray = [AidModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"activitys"]];
        [self.aidArray addObjectsFromArray:tempArray];
        [_aidTableView reloadData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (UITableView *)aidTableView
{
    if (!_aidTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _aidTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _aidTableView.delegate = self;
        _aidTableView.dataSource = self;
        _aidTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _aidTableView.showsVerticalScrollIndicator = NO;
        _aidTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _aidTableView.estimatedRowHeight = 0;
        _aidTableView.estimatedSectionHeaderHeight = 0;
        _aidTableView.estimatedSectionFooterHeight = 0;
    }
    return _aidTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AidModel * model;
    if (_aidArray.count) {
        model = _aidArray[indexPath.row];
    }
    AidTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[AidTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _aidArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AidModel * model;
    if (_aidArray.count) {
        model = _aidArray[indexPath.row];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AidDetailViewController * aidVC = [[AidDetailViewController alloc] init];
    aidVC.aidId = model.activityId;
    aidVC.aidModel = model;
    [self.navigationController pushViewController:aidVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (SCREEN_WIDTH - 30) * 157 / 345 + 16 + 38 + 12;
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
