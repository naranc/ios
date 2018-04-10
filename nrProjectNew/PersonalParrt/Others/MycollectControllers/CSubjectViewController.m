//
//  CSubjectViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "CSubjectViewController.h"

#import "SubjectTableViewCell.h"

static NSString * cellitifter = @"cellitifter";

@interface CSubjectViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * subjectTableView;

@property (nonatomic, strong) NSMutableArray * subjectArray;

@end

@implementation CSubjectViewController
- (NSMutableArray *)subjectArray
{
    if (!_subjectArray) {
        _subjectArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _subjectArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary * dic = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"与黑色和白色手机搭配更适合。大冬",@"bgImage":@"xhdpibanner.png"};
    
    NSDictionary * dic1 = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"华为刚出n的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬",@"bgImage":@"xhdpibanner.png"};
    
    NSDictionary * dic2 = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"华附赠的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬 ",@"bgImage":@"xhdpibanner.png"};
    
    NSDictionary * dic3 = @{@"title":@"这是我的心愿，这是我的哈哈哈哈。",@"content":@"华为刚出nov刚出nova时，随手机附a时刚出nova时，随手机附，随手刚出nova时，随手机附刚出nova时，随手机附刚出nova时，随手机附刚出nova时，随手机附机附赠的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬",@"bgImage":@"xhdpibanner.png"};
    
    [self.subjectArray addObject:dic1];
    [self.subjectArray addObject:dic2];
    [self.subjectArray addObject:dic3];
    [self.subjectArray addObject:dic2];
    [self.subjectArray addObject:dic1];
    [self.subjectArray addObject:dic];
    [self.subjectArray addObject:dic1];
    [self.subjectArray addObject:dic];
    [self.subjectArray addObject:dic3];
    
    [self.view addSubview:self.subjectTableView];
    
}
- (UITableView *)subjectTableView
{
    if (!_subjectTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - top - 32);
        _subjectTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _subjectTableView.delegate = self;
        _subjectTableView.dataSource = self;
        _subjectTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _subjectTableView.showsVerticalScrollIndicator = NO;
        _subjectTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _subjectTableView.estimatedRowHeight = 0;
        _subjectTableView.estimatedSectionHeaderHeight = 0;
        _subjectTableView.estimatedSectionFooterHeight = 0;
    }
    return _subjectTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[SubjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:_subjectArray[indexPath.row] indexPath:indexPath];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _subjectArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = _subjectArray[indexPath.row];
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:dic[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    CGFloat realHeight;
    if (rect.size.height > 60) {
        realHeight = 60;
    }else{
        realHeight = rect.size.height;
    }
    return (SCREEN_WIDTH - 30) * 157 / 345 + 12 + 13 + 8 + 22 + 4 + 66 + realHeight;
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
