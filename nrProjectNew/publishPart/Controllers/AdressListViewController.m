//
//  AdressListViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AdressListViewController.h"
#import "AdressListTableViewCell.h"
#import "AddAdressViewController.h"
#import "AdressModel.h"
static NSString * cellitifter = @"cellitifter";

@interface AdressListViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    AdressModel * deleteModel;
}
@property (nonatomic, strong)UITableView * adressListTableView;

@property (nonatomic, strong)NSMutableArray * adressListArray;

@end

@implementation AdressListViewController
- (NSMutableArray *)adressListArray
{
    if (!_adressListArray) {
        _adressListArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _adressListArray;
}
- (void)refreshList
{
    [_adressListArray removeAllObjects];
    [self getAdressListData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"收货地址"];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:@"NotifitercationAddAdressSuccess" object:nil];
    
    UIButton * addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    [addButton setTitle:@"添加地址" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    [addButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
    addButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    [self.view addSubview:addButton];
    
    [self.view addSubview:self.adressListTableView];
    [self getAdressListData];
    
}
- (void)getAdressListData
{
    NSDictionary * adressDic = @{@"accessToken":[UserModel getUser].accessToken,@"pageNum":@1,@"pageSize":@30};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AdressModel getAdressListtWithParament:adressDic success:^(NSDictionary *dic) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"adressList = %@",dic);
        NSLog(@"adressList = %@",dic[@"msg"]);
        NSMutableArray * tempArray = [AdressModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"mails"]];
        [self.adressListArray addObjectsFromArray:(NSArray*)tempArray];
        [_adressListTableView reloadData];
    } withFailureBlock:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",error);
    }];
}
- (void)addButton:(UIButton *)btn
{
    AddAdressViewController * addVC = [[AddAdressViewController alloc] init];
    addVC.viewTitle = @"添加地址";
    [self.navigationController pushViewController:addVC animated:YES];
}
- (UITableView *)adressListTableView
{
    if (!_adressListTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 49);
        _adressListTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _adressListTableView.delegate = self;
        _adressListTableView.dataSource = self;
        _adressListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _adressListTableView.showsVerticalScrollIndicator = NO;
        _adressListTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _adressListTableView.tableFooterView = [UIView new];
        _adressListTableView.estimatedRowHeight = 0;
        _adressListTableView.estimatedSectionHeaderHeight = 0;
        _adressListTableView.estimatedSectionFooterHeight = 0;
    }
    return _adressListTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdressListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[AdressListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:_adressListArray[indexPath.row] indexPath:indexPath];
    cell.onClickSelectAdressButton = ^{
        AdressModel * model;
        if (_adressListArray.count) {
            model = _adressListArray[indexPath.row];
        }
        if (!model.nowMail) {
            NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"mailId":model.mailId};
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [AdressModel setAdressNowWithParament:dic success:^(NSDictionary *dic) {
                if ([dic[@"code"] isEqualToString:NormalStatus]) {
                    for (AdressModel * adress in _adressListArray) {
                        if (adress.mailId == model.mailId) {
                            adress.nowMail = YES;
                        }else{
                            adress.nowMail = NO;
                        }
                    }
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [_adressListTableView reloadData];
                }
            } withFailureBlock:^(NSError *error) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                NSLog(@"%@",error);
            }];
        }
    };
    cell.onClickEidtButton = ^{
        AdressModel * model;
        if (_adressListArray.count) {
            model = _adressListArray[indexPath.row];
        }
        AddAdressViewController * addVC = [[AddAdressViewController alloc] init];
        addVC.viewTitle = @"编辑地址";
        addVC.adressModel = model;
        [self.navigationController pushViewController:addVC animated:YES];
    };
    cell.onClickDeleteButton = ^{
        NSLog(@"删除地址");
//        AdressModel * model;
        if (_adressListArray.count) {
            deleteModel = _adressListArray[indexPath.row];
        }
        UIAlertView * alterView;
        if (!alterView) {
            alterView = [[UIAlertView alloc] initWithTitle:@"确定要删除该地址吗？" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        }
        [alterView show];
    };
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _adressListArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdressModel * model;
    if (_adressListArray.count) {
        model = _adressListArray[indexPath.row];
    }
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:[NSString stringWithFormat:@"    %@%@%@%@",model.province,model.city,model.county,model.mailAddress] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
    return  12 + 48 * 2 + rect.size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectAdress) {
        AdressModel * model;
        if (_adressListArray.count) {
            model = _adressListArray[indexPath.row];
        }
        [_delegate selectAdressModel:model];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"mailId":deleteModel.mailId};
        [AdressModel deleteAdressWithParament:dic success:^(NSDictionary *dic) {
            if ([dic[@"code"] isEqualToString:NormalStatus]) {
                [self.adressListArray removeAllObjects];
                [self getAdressListData];
            }
        } withFailureBlock:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
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
