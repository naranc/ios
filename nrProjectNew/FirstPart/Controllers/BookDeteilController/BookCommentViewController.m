//
//  BookCommentViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookCommentViewController.h"
#import "BookCommentTableViewCell.h"
#import "PublishBCommentViewController.h"
#import "BookCommentDetailViewController.h"
@interface BookCommentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * bookCommentArray;

@property (nonatomic, strong) UITableView * bookCommentTableView;

@property (nonatomic, strong) UIButton * publishButton;

@end

@implementation BookCommentViewController
- (NSMutableArray *)bookCommentArray
{
    if (!_bookCommentArray) {
        _bookCommentArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _bookCommentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"书评"];
    
    
    NSDictionary * dic =@{@"picImage":@"userimagePic.jpg",@"name":@"乘风破浪",@"content":@"那一日正当三月中浣，早饭后，宝玉携了一套《会真记》，走到沁芳闸桥边桃花底下一块石上坐着，展开《会真记》，从头细玩。正看到“落红成阵”，只…"};
    
    NSDictionary * dic1 =@{@"picImage":@"userimagePic.jpg",@"name":@"乘风破浪",@"content":@"侬今葬花人笑痴，他年葬侬知是谁。 试看春残花渐落，便是红颜老死时。 一朝春尽红颜老，花落人 ..."};
    
    NSDictionary * dic2 =@{@"picImage":@"userimagePic.jpg",@"name":@"乘风破浪",@"content":@"侬今葬花人笑痴，他年葬侬知是谁。 试看春残花渐落，便是红颜老死时。 一朝春尽红颜老，花落人亡两不知。 ——节选林黛玉《葬花词》"};

    [self.bookCommentArray addObject:dic];
    [self.bookCommentArray addObject:dic1];
    [self.bookCommentArray addObject:dic2];
    [self.bookCommentArray addObject:dic];
    [self.bookCommentArray addObject:dic1];
    [self.bookCommentArray addObject:dic2];
    [self.bookCommentArray addObject:dic];
    [self.bookCommentArray addObject:dic1];
    [self.bookCommentArray addObject:dic2];


    [self.view addSubview:self.bookCommentTableView];
    [self.view addSubview:self.publishButton];

}
- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _publishButton.frame = CGRectMake(SCREEN_WIDTH - 102, SCREEN_HEIGHT - 160, 102, 60);
        [_publishButton setImage:[UIImage imageNamed:@"side_fabu"] forState:UIControlStateNormal];
        weakify(self);
        [_publishButton addAction:^(UIButton *btn) {
            PublishBCommentViewController * bcommentVC = [[PublishBCommentViewController alloc] init];
            [weakSelf.navigationController pushViewController:bcommentVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishButton;
}
- (UITableView *)bookCommentTableView
{
    if (!_bookCommentTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _bookCommentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _bookCommentTableView.delegate = self;
        _bookCommentTableView.dataSource = self;
        _bookCommentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bookCommentTableView.showsVerticalScrollIndicator = NO;
        _bookCommentTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _bookCommentTableView.estimatedRowHeight = 0;
        _bookCommentTableView.estimatedSectionHeaderHeight = 0;
        _bookCommentTableView.estimatedSectionFooterHeight = 0;
        _bookCommentTableView.alwaysBounceVertical = NO;
    }
    return _bookCommentTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic;
    if (_bookCommentArray.count) {
        dic = _bookCommentArray[indexPath.row];
    }
    BookCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BookCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCommentContent:dic indexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _bookCommentArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic;
    if (_bookCommentArray.count) {
        dic = _bookCommentArray[indexPath.row];
    }
    CGFloat contentHeight = [[GlobalSingleton Singleton]getHeigthWithText:dic[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]].size.height;
    return 130 + contentHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BookCommentDetailViewController * detailVC = [[BookCommentDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
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
