//
//  CWishViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "CWishViewController.h"
#import "WishListTableViewCell.h"
#import "WishModel.h"

static NSString * cellitifter = @"cellitifter";

@interface CWishViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat cellHeight;

}
@property (nonatomic, strong) UITableView * listTableView;

@property (nonatomic, strong) NSMutableArray * wishArray;

@end

@implementation CWishViewController
- (NSMutableArray *)wishArray
{
    if (!_wishArray) {
        _wishArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _wishArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    cellHeight = (SCREEN_WIDTH - 30) * 238 / 345 + 60 + 12 + 16;
                  
    [self.view addSubview:self.listTableView];
    
    
    WishModel * wishModel = [[WishModel alloc] init];
    wishModel.createTime = @"2018-01-09 20:03:20";
    wishModel.initiatorId = @5;
    wishModel.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    wishModel.initiatorNike = @"156****7367";
    wishModel.orderContent = @"大萨达asdasdasdsfgsdf大萨达大所多sdfsfsfsdfs发发计划是否卡dfdsfsdfsdf段还是快点回家爱上";
    wishModel.orderId = @8;
    wishModel.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/1515499326704_622.jpg";
    wishModel.orderTitle = @"1231231231挨饿受冻防守打法多少";
    wishModel.orderType = @"WISH";
    wishModel.updateTime = @"2018-01-09 20:03:20";

    
    WishModel * wishModel1 = [[WishModel alloc] init];
    wishModel1.createTime = @"2018-01-09 20:03:20";
    wishModel1.initiatorId = @5;
    wishModel1.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    wishModel1.initiatorNike = @"156****7367";
    wishModel1.orderContent = @"大萨达asdasdasdsfgsdf大萨达大所多sdfsfsfsdfs发发计划是否卡dfdsfsdfsdf段还是快点回家爱上";
    wishModel1.orderId = @8;
    wishModel1.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png";
    wishModel1.orderTitle = @"1231231231挨饿受冻防守打法多少";
    wishModel1.orderType = @"WISH";
    wishModel1.updateTime = @"2018-01-09 20:03:20";
    
    
    
    WishModel * wishModel2 = [[WishModel alloc] init];
    wishModel2.createTime = @"2018-01-09 20:03:20";
    wishModel2.initiatorId = @5;
    wishModel2.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    wishModel2.initiatorNike = @"156****7367";
    wishModel2.orderContent = @"大萨达asdasdasdsfgsdf大萨达大所多sdfsfsfsdfs发发计划是否卡dfdsfsdfsdf段还是快点回家爱上";
    wishModel2.orderId = @8;
    wishModel2.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png";
    wishModel2.orderTitle = @"1231231231挨饿受冻防守打法多少";
    wishModel2.orderType = @"WISH";
    wishModel2.updateTime = @"2018-01-09 20:03:20";
    
    

    [self.wishArray addObject:wishModel];
    [self.wishArray addObject:wishModel1];
    [self.wishArray addObject:wishModel2];
    [_listTableView reloadData];

    
    
    
    
                  
}
- (UITableView *)listTableView
{
    if (!_listTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - top - 32);
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
    }
    return _listTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WishModel * model;
    if (_wishArray.count) {
        model = _wishArray[indexPath.row];
    }
    WishListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[WishListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _wishArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
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
