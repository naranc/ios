//
//  MyPartInFViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "MyPartInFViewController.h"
#import "AidTableViewCell.h"
static NSString * cellitifter = @"cellitifter";

@interface MyPartInFViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * aidTableView;

@end

@implementation MyPartInFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    [self.view addSubview:self.aidTableView];
}
- (UITableView *)aidTableView
{
    if (!_aidTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - top - 32);
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
    AidTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[AidTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:nil indexPath:indexPath];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
