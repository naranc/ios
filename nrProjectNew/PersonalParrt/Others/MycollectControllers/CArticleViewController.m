//
//  CArticleViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "CArticleViewController.h"

#import "RecommentTableViewCell.h"
static NSString * cellitifter = @"cellitifter";

@interface CArticleViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * recommendTableView;

@property (nonatomic, strong) NSMutableArray * recommendArray;
@end

@implementation CArticleViewController
- (NSMutableArray *)recommendArray
{
    if (!_recommendArray) {
        _recommendArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _recommendArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary * dic = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"与黑色和白色手机搭配更适合。大冬",@"bgImage":@"xhdpibanner.png"};
    
    NSDictionary * dic1 = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"华为刚出n的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬",@"bgImage":@"xhdpibanner.png"};
    
    NSDictionary * dic2 = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"华附赠的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬 ",@"bgImage":@"xhdpibanner.png"};
    
    NSDictionary * dic3 = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"华为刚出nov刚出nova时，随手机附a时刚出nova时，随手机附，随手刚出nova时，随手机附刚出nova时，随手机附刚出nova时，随手机附刚出nova时，随手机附机附赠的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬",@"bgImage":@"xhdpibanner.png"};
    
    [self.recommendArray addObject:dic1];
    [self.recommendArray addObject:dic2];
    [self.recommendArray addObject:dic3];
    [self.recommendArray addObject:dic2];
    [self.recommendArray addObject:dic1];
    [self.recommendArray addObject:dic];
    [self.recommendArray addObject:dic1];
    [self.recommendArray addObject:dic];
    [self.recommendArray addObject:dic3];
    
    [self.view addSubview:self.recommendTableView];
    
}
- (UITableView *)recommendTableView
{
    if (!_recommendTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - top - 32);
        _recommendTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _recommendTableView.delegate = self;
        _recommendTableView.dataSource = self;
        _recommendTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recommendTableView.showsVerticalScrollIndicator = NO;
        _recommendTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _recommendTableView.estimatedRowHeight = 0;
        _recommendTableView.estimatedSectionHeaderHeight = 0;
        _recommendTableView.estimatedSectionFooterHeight = 0;
    }
    return _recommendTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[RecommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell configCellWithModel:_recommendArray[indexPath.row] indexPath:indexPath];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _recommendArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = _recommendArray[indexPath.row];
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:dic[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    CGFloat realHeight;
    if (rect.size.height > 60) {
        realHeight = 60;
    }else{
        realHeight = rect.size.height;
    }
    
    return (SCREEN_WIDTH - 30) * 157 / 345 + 68 + 49 + 8 + realHeight + 44 + 16;
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
