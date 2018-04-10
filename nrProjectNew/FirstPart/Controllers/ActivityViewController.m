//
//  ActivityViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/18.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"

static NSString * cellitifter = @"cellitifter";

@interface ActivityViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * activityTableView;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    [self.view addSubview:self.activityTableView];
}
- (UITableView *)activityTableView
{
    if (!_activityTableView) {
//        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGFloat top;
        if ([WRNavigationBar isIphoneX]) {
            top = 40;
        }else{
            top = 25;
        }
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - top - self.tabBarController.tabBar.height - 32);
        _activityTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _activityTableView.delegate = self;
        _activityTableView.dataSource = self;
        _activityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _activityTableView.showsVerticalScrollIndicator = NO;
        _activityTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _activityTableView.estimatedRowHeight = 0;
        _activityTableView.estimatedSectionHeaderHeight = 0;
        _activityTableView.estimatedSectionFooterHeight = 0;
    }
    return _activityTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[ActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (SCREEN_WIDTH - 30) * 125 / 345 + 16;
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
