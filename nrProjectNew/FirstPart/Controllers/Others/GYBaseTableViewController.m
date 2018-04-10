//
//  GYBaseTableViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "GYBaseTableViewController.h"
#import "GradeViewController.h"
#import "AchievementViewController.h"
#define textFont [UIFont fontWithName:@"PingFangSC-Regular" size:10.5]
#define labelTextColor kUIColorFromRGB(0x999999)
@interface GYBaseTableViewController ()

@property (nonatomic, strong) UIView * gyHeadView;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) UILabel * userRankeingL;

@property (nonatomic, strong) UILabel * markLabel;

@end

@implementation GYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    if ([self isKindOfClass:[GradeViewController class]] || [self isKindOfClass:[AchievementViewController class]]) {
        self.tableView.tableHeaderView = self.headView;
        [_headView addSubview:self.userRankeingL];
        [_headView addSubview:self.markLabel];
        if ([self isKindOfClass:[GradeViewController class]]) {
            _markLabel.text = @"等级";
        }else{
            _markLabel.text = @"勋章";
        }
    }else{
        self.tableView.tableHeaderView = self.gyHeadView;
        [_gyHeadView addSubview:self.userRankeingL];
        [_gyHeadView addSubview:self.markLabel];
        _userRankeingL.frame = CGRectMake(15, 44, 50, 15);
        _markLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - 50, 44, 50, 15);
        _markLabel.text = @"公益次数";
        [self addSubViews:_gyHeadView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 28);
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
        _userRankeingL.text = @"用户排名";
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
- (UIView *)gyHeadView
{
    if (!_gyHeadView) {
        _gyHeadView = [[UIView alloc] init];
        _gyHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        _gyHeadView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _gyHeadView;
}
- (void)addSubViews:(UIView *)view
{
    
    CGFloat top = 12;
    
    CGFloat wight = 40;
    
    CGFloat height = 18;
    
    CGFloat space = 18;
    
    CGFloat left = (SCREEN_WIDTH - 3*space - 4*wight) / 2;

    NSArray * array = @[@"日榜",@"周榜",@"月榜",@"总榜"];
    for (int i = 0; i < 4; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(left + i * (18 + wight), top, wight, height);
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.layer.cornerRadius = 9.0f;
        button.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        [button setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        button.tag = 1001+i;
        [button addTarget:self action:@selector(clickOnRnkingType:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
}
- (void)clickOnRnkingType:(UIButton *)btn
{
    for (int i = 0; i < 4; i ++) {
        UIButton * button = [_gyHeadView viewWithTag:i + 1001];
        if (btn.tag == i + 1001) {
            button.layer.borderWidth = 0.5;
            button.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        }else{
            button.layer.borderWidth = 0;
        }
    }
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
