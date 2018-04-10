//
//  MyDonateViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/28.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "MyDonateViewController.h"
#import "DonateModel.h"
#import "DonateTableViewCell.h"

static NSString * cellitifter = @"cellitifter";
@interface MyDonateViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * listTableView;
@property (nonatomic, strong) NSArray * imageTArray;

@property (nonatomic, strong) NSMutableArray *dynamicArray;


@end

@implementation MyDonateViewController
- (NSMutableArray *)dynamicArray {
    if (_dynamicArray == nil) {
        _dynamicArray = [NSMutableArray array];
    }
    return _dynamicArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"我的发布"];

    [self getData];
    [self.view addSubview:self.listTableView];
}
- (void)getData
{
    
    
    DonateModel * donate = [[DonateModel alloc] init];
    donate.createTime = @"2018-01-09 12:02:33";
    donate.initiatorId = @4;
    donate.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    donate.initiatorNike = @"156****7367";
    donate.orderContent = @"大萨达asdasdasdsfgsdf大萨达大所多sdfsfsfsdfs发发计划是否卡dfdsfsdfsdf段还是快点回家爱上";
    donate.orderId = @8;
    donate.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/1515470546947_682.jpg";
    donate.orderTitle = @"1231231231挨饿受冻防守打法多少";
    donate.orderType = @"DONATION";
    donate.typeName = @"捐赠";
    donate.updateTime = @"2018-01-09 20:03:20";
    
    
    
    DonateModel * donate1 = [[DonateModel alloc] init];
    donate1.createTime = @"2018-01-09 12:02:33";
    donate1.initiatorId = @4;
    donate1.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    donate1.initiatorNike = @"156****7367";
    donate1.orderContent = @"大萨达asdasdasdsfgsdf大萨达大所多sdfsfsfsdfs发发计划是否卡dfdsfsdfsdf段还是快点回家爱上";
    donate1.orderId = @8;
    donate1.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/1515418600120_335.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600121_742.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600121_874.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600122_132.jpg,http://orkypu4y4.bkt.clouddn.com/1515418600122_363.jpg";
    donate1.orderTitle = @"1231231231挨饿受冻防守打法多少";
    donate1.orderType = @"DONATION";
    donate1.typeName = @"捐赠";
    donate1.updateTime = @"2018-01-09 20:03:20";
    
    DonateModel * donate2 = [[DonateModel alloc] init];
    donate2.createTime = @"2018-01-09 12:02:33";
    donate2.initiatorId = @4;
    donate2.initiatorImg = @"http://orkypu4y4.bkt.clouddn.com/home1.png-60";
    donate2.initiatorNike = @"156****7367";
    donate2.orderContent = @"大萨达asdasdasdsfgsdf大萨达大所多sdfsfsfsdfs发发计划是否卡dfdsfsdfsdf段还是快点回家爱上";
    donate2.orderId = @8;
    donate2.orderImgs = @"http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png,http://orkypu4y4.bkt.clouddn.com/home1.png";
    donate2.orderTitle = @"1231231231挨饿受冻防守打法多少";
    donate2.orderType = @"DONATION";
    donate2.typeName = @"捐赠";
    donate2.updateTime = @"2018-01-09 20:03:20";
    
    
    
    
    [self.dynamicArray addObject:donate];
    [self.dynamicArray addObject:donate1];
    [self.dynamicArray addObject:donate2];
    
    
    
    
    
}
- (UITableView *)listTableView
{
    if (!_listTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
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
    DonateModel * model;
    if (_dynamicArray.count) {
        model = _dynamicArray[indexPath.row];
    }
    DonateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[DonateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dynamicArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonateModel * model = _dynamicArray[indexPath.row];
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
//    return 10 + 15 + 40 + 12 + 20 + 8  + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 15;
    return 16 + 40 + 12 + 20 + 8 + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 45 + 12;

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
