//
//  NeedDonateDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/18.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "NeedDonateDetailViewController.h"
#import "DonateModel.h"
#import "WishModel.h"
#import "DetailWishHeadView.h"
#import "NeedDonateDetailViewController.h"
#import "InputWayNumberViewController.h"
#import "PublishModel.h"
#import "SellerAffirmViewController.h"
#import "AdressModel.h"
#import "CarriagingViewController.h"

@interface NeedDonateDetailViewController ()

@property (nonatomic, strong)UIButton * acceptbutton;

@property (nonatomic, strong)UIButton * refusebutton;

@property (nonatomic, strong)UIButton * infobutton;

//捐赠者自己进来的时候去撤回
@property (nonatomic, strong)UIButton * recallbutton;

@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) DetailWishHeadView * scDetailView;

@end

@implementation NeedDonateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"捐赠详情"];
    
    //布局心愿详情
    NSLog(@"applyDic = %@",_dicModel);
    NSDictionary * dic = @{@"applyId":_dicModel[@"applyId"]};
    [DonateModel needDetailDonateWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"needDonateDic = %@",dic);
        NSLog(@"msg = %@",dic[@"msg"]);
        if ([dic[@"code"] isEqualToString:NormalStatus]) {
            _dicModel = dic[@"data"];
            [self setUI];
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
    
}
- (void)setUI
{
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:_dicModel[@"applyContent"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
    
    WishModel * tempModel = [[WishModel alloc] init];
    tempModel.orderImgs = _dicModel[@"applyImgs"];
    tempModel.initiatorImg = _dicModel[@"accountImg"];
    tempModel.initiatorNike = _dicModel[@"accountNike"];
    tempModel.city = _dicModel[@"city"];
    tempModel.orderTitle = _dicModel[@"applyTitle"];
    tempModel.orderContent = _dicModel[@"applyContent"];
    if (_dicModel[@"applyImgs"]) {
        //有图
        NSArray * imageArray;
        if ([_dicModel[@"applyImgs"] containsString:@","]) {
            imageArray = [_dicModel[@"applyImgs"] componentsSeparatedByString:@","];//以“,”切割
        }else{
            imageArray = @[_dicModel[@"applyImgs"]];
        }
        if (imageArray.count == 1) {
            //1张图
            _scDetailView = [[DetailWishHeadView alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 162 + rect.size.height + SCREEN_WIDTH - 30) HasOnePic:YES model:tempModel];
            
        }else{
            //2张图 或者更多图
            _scDetailView = [[DetailWishHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 162 + rect.size.height + [self getlineCount:imageArray.count]) morePic:YES model:tempModel];
            
        }
    }else{
        //无图
        _scDetailView = [[DetailWishHeadView alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 165 + rect.size.height) model:tempModel];
    }
    
    _scDetailView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    [self.view addSubview:self.scrollView];
    [_scrollView addSubview:_scDetailView];
    _scrollView.contentSize = CGSizeMake(0, _scDetailView.height + 20);
    
    
    //需要此捐赠的人
    if (_dicModel[@"accountId"] == [UserModel getUser].accountId) {
       
        if ([_donateModel.orderStatus isEqualToString:@"INITIAL"]) {
            self.recallbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
            [_recallbutton setTitle:@"撤回" forState:UIControlStateNormal];
            [self.view addSubview:_recallbutton];
        }
        
        
        if ([_donateModel.orderStatus isEqualToString:@"WAITING"]) {
            
            if ([_donateModel.mailStatus isEqualToString:@"GOING"]) {
                self.infobutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
                [self.view addSubview:_infobutton];
                
            }else{
                self.infobutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
                [_infobutton setTitle:@"等待发货" forState:UIControlStateNormal];
                [self.view addSubview:_infobutton];
            }
            
            
        }
        
    }
    
    //此捐赠本人
    if (_donateModel.initiatorId == [UserModel getUser].accountId) {
        
        //判断此订单与本人的关系
        NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_donateModel.orderId};
        [PublishModel getOrderStatusWithMeParament:parament success:^(NSDictionary *dic) {
            NSLog(@"OrderStatusDic = %@",dic);
            NSDictionary * tempDic = dic[@"data"];
            if (tempDic[@"myApply"]) {
                
            }
            
        } withFailureBlock:^(NSError *error) {
            NSLog(@"error = %@",error);
        }];
        
        
        //待作者本人操作
        if ([_donateModel.orderStatus isEqualToString:@"INITIAL"]) {
            self.refusebutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH/2, 49);
            [self.view addSubview:_refusebutton];
            
            self.acceptbutton.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 49, SCREEN_WIDTH/2, 49);
            [self.view addSubview:_acceptbutton];
        }
    }
    
    
    
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        _scrollView.frame =  CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 49);
        _scrollView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _scrollView;
}
- (UIButton *)acceptbutton
{
    if (!_acceptbutton) {
        _acceptbutton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_acceptbutton setTitle:@"捐赠给ta" forState:UIControlStateNormal];
        [_acceptbutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _acceptbutton.backgroundColor = MainColor;
        weakify(self);
        [_acceptbutton addAction:^(UIButton *btn) {
            //11
//            InputWayNumberViewController * inputVC = [[InputWayNumberViewController alloc] init];
//            inputVC.applyId = weakSelf.dicModel[@"applyId"];
//            inputVC.byWayType = @"DONATE";
//            [weakSelf.navigationController pushViewController:inputVC animated:YES];
            SellerAffirmViewController * sellerVC = [[SellerAffirmViewController alloc] init];
            sellerVC.applyDic = weakSelf.dicModel;
            [weakSelf.navigationController pushViewController:sellerVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _acceptbutton;
}
- (UIButton *)refusebutton
{
    if (!_refusebutton) {
        _refusebutton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_refusebutton setTitle:@"再考虑一下" forState:UIControlStateNormal];
        _refusebutton.backgroundColor = kUIColorFromRGB(0x999999);
        [_refusebutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        weakify(self);
        [_refusebutton addAction:^(UIButton *btn) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _refusebutton;
}

- (UIButton *)infobutton
{
    if (!_infobutton) {
        _infobutton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_infobutton setTitle:@"物流查询" forState:UIControlStateNormal];
        _infobutton.backgroundColor = MainColor;
        [_infobutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_infobutton addAction:^(UIButton *btn) {
            CarriagingViewController * carryVC = [[CarriagingViewController alloc] init];
            carryVC.mailCodeNumber = _donateModel.mailCode;
            [self.navigationController pushViewController:carryVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _infobutton;
}
- (UIButton *)recallbutton
{
    if (!_recallbutton) {
        _recallbutton = [UIButton buttonWithType:UIButtonTypeSystem];
        _recallbutton.backgroundColor = kUIColorFromRGB(0x65BCFF);
        [_recallbutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        weakify(self);
        [_recallbutton addAction:^(UIButton *btn) {
            
            //申请次捐赠的人主动撤回
            if ([btn.titleLabel.text isEqualToString:@"撤回"]) {
                NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken, @"applyId":weakSelf.dicModel[@"applyId"]};
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                [DonateModel withdrawThirdDonateWithParament:dic success:^(NSDictionary *dic) {
                    NSLog(@"recallDic = %@",dic)
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                    if ([dic[@"code"] isEqualToString:NormalStatus]) {
                        [weakSelf.navigationController popViewControllerAnimated:YES];
                        [_delegate refreshDonateDetailView];
                    }
                } withFailureBlock:^(NSError *error) {
                    NSLog(@"error = %@",error);
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                }];
            }
            
            
            
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _recallbutton;
}

- (void)operationWithType:(NSString *)type
{
    //捐赠者撤回此捐赠
    [DonateModel withdrawThirdDonateWithParament:nil success:^(NSDictionary *dic) {
        
    } withFailureBlock:^(NSError *error) {
        
    }];
    
    
}

- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return (SCREEN_WIDTH - 30 - 24) / 4;
    }else if (count >= 4 & count < 8){
        return ((SCREEN_WIDTH - 30 - 24) / 4 ) * 2 + 8;
    }else{
        return ((SCREEN_WIDTH - 30 - 24) / 4 ) * 3 + 16;
    }
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
