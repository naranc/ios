//
//  DetailWishViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/18.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "DetailWishViewController.h"
#import "DonateModel.h"
#import "WishModel.h"
#import "DetailWishHeadView.h"
#import "InputWayNumberViewController.h"
#import "CarriagingViewController.h"

@interface DetailWishViewController ()

@property (nonatomic, strong)UIButton * acceptbutton;

@property (nonatomic, strong)UIButton * refusebutton;

@property (nonatomic, strong)UIButton * infobutton;

//捐赠者自己进来的时候去撤回
@property (nonatomic, strong)UIButton * recallbutton;

@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) DetailWishHeadView * scDetailView;

@end

@implementation DetailWishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //这个页面是有人捐赠的详情页面  ，  发表该心愿的人进来操作， 以及该物品发货的物流信息
    [self.customNavBar setTitle:@"心愿详情"];
    

    
    //布局心愿详情
    NSLog(@"applyDic = %@",_dicModel);
    
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
            _scDetailView = [[DetailWishHeadView alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 162 + rect.size.height + [self getlineCount:imageArray.count]) morePic:YES model:tempModel];
            
        }
    }else{
        //无图
        _scDetailView = [[DetailWishHeadView alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 165 + rect.size.height) model:tempModel];
    }
    
    _scDetailView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    [self.view addSubview:self.scrollView];
    [_scrollView addSubview:_scDetailView];
    _scrollView.contentSize = CGSizeMake(0, _scDetailView.height + 20);

    
    
    //此心愿捐赠者
    if (_dicModel[@"accountId"] == [UserModel getUser].accountId) {
        
        if ([_wishModel.orderStatus isEqualToString:@"WAITING"]) {
            self.recallbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
            [_recallbutton setTitle:@"填写物流单号" forState:UIControlStateNormal];
            [self.view addSubview:_recallbutton];
        }
        
        if ([_wishModel.orderStatus isEqualToString:@"GOING"]) {
            self.recallbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
            [_recallbutton setTitle:@"撤回" forState:UIControlStateNormal];
            _recallbutton.tag = 1001;
            [self.view addSubview:_recallbutton];
        }
        
    }
    
    //此心愿本人
    if (_wishModel.initiatorId == [UserModel getUser].accountId) {
        
        if ([_wishModel.orderStatus isEqualToString:@"WAITING"]) {
            
            if ([_wishModel.mailStatus isEqualToString:@"GOING"]) {
                self.recallbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
                [_recallbutton setTitle:@"查询物流" forState:UIControlStateNormal];
                [self.view addSubview:_recallbutton];
                
            }else{
                self.recallbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
                [_recallbutton setTitle:@"等待发货" forState:UIControlStateNormal];
                _recallbutton.enabled = NO;
                [self.view addSubview:_recallbutton];
            }
            
        }
        
        if ([_wishModel.orderStatus isEqualToString:@"GOING"]) {
            
            self.acceptbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH/2, 49);
            [self.view addSubview:_acceptbutton];
            
            self.refusebutton.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 49, SCREEN_WIDTH/2, 49);
            [self.view addSubview:_refusebutton];
        }
        
        
        if ([_wishModel.orderStatus isEqualToString:@"SUCCESS"]) {
            
            self.recallbutton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
            [_recallbutton setTitle:@"已完成" forState:UIControlStateNormal];
            _recallbutton.enabled = NO;
            [self.view addSubview:_recallbutton];
            
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
        [_acceptbutton setTitle:@"接受" forState:UIControlStateNormal];
        [_acceptbutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _acceptbutton.backgroundColor = MainColor;
        weakify(self);
        [_acceptbutton addAction:^(UIButton *btn) {
            NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken,@"applyId":weakSelf.dicModel[@"applyId"],@"applyStatus":@"SUCCESS"};
            [WishModel confirmWishWithParament:parament success:^(NSDictionary *dic) {
                NSLog(@"dic = %@",dic)
                if ([dic[@"code"] isEqualToString:NormalStatus]) {
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"接受成功！" duration:MBProgressHUDDuration];
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                    [weakSelf.delegate refreshWishDetailView];

                }else{
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                }
            } withFailureBlock:^(NSError *error) {
                NSLog(@"error = %@",error);
                [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"网络超时或网络错误" duration:MBProgressHUDDuration];
            }];
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _acceptbutton;
}
- (UIButton *)refusebutton
{
    if (!_refusebutton) {
        _refusebutton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_refusebutton setTitle:@"拒绝" forState:UIControlStateNormal];
        _refusebutton.backgroundColor = kUIColorFromRGB(0x999999);
        [_refusebutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        weakify(self);
        [_refusebutton addAction:^(UIButton *btn) {
            NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken,@"applyId":weakSelf.dicModel[@"applyId"],@"applyStatus":@"FAIL"};
            [WishModel confirmWishWithParament:parament success:^(NSDictionary *dic) {
                if ([dic[@"code"] isEqualToString:NormalStatus]) {
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"拒绝成功！" duration:MBProgressHUDDuration];
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                    [weakSelf.delegate refreshWishDetailView];
                }else{
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"拒绝失败！" duration:MBProgressHUDDuration];
                }
            } withFailureBlock:^(NSError *error) {
                NSLog(@"error = %@",error);
                [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"网络超时或网络错误" duration:MBProgressHUDDuration];
            }];
            
            
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
    }
    return _infobutton;
}
- (UIButton *)recallbutton
{
    if (!_recallbutton) {
        _recallbutton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_recallbutton setTitle:@"撤回" forState:UIControlStateNormal];
        _recallbutton.backgroundColor = kUIColorFromRGB(0x65BCFF);
        [_recallbutton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        weakify(self);
        [_recallbutton addAction:^(UIButton *btn) {
            
            if ([weakSelf.recallbutton.titleLabel.text isEqualToString:@"撤回"]) {
                //撤回
                if (btn.tag == 1001) {
                    //捐赠的人撤回
                    [weakSelf operationWithType:@""];
                }else{
                    //发布心愿的人撤回
                    [weakSelf operationWithType:@""];

                }
            }else if ([weakSelf.recallbutton.titleLabel.text isEqualToString:@"查询物流"]) {
                CarriagingViewController * carryVC = [[CarriagingViewController alloc] init];
                carryVC.mailCodeNumber = _wishModel.mailCode;
                [weakSelf.navigationController pushViewController:carryVC animated:YES];
            }else{
                //填写物流单号
                InputWayNumberViewController * inputVC = [[InputWayNumberViewController alloc] init];
                inputVC.applyId = weakSelf.dicModel[@"applyId"];
                inputVC.orderId = weakSelf.wishModel.orderId;
                [weakSelf.navigationController pushViewController:inputVC animated:YES];
            }
            
            
           
            
            
        } forControlEvents:UIControlEventTouchUpInside];

    }
    return _recallbutton;
}

- (void)operationWithType:(NSString *)type
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary * dic = @{@"applyId":_dicModel[@"applyId"],@"accessToken":[UserModel getUser].accessToken};
    [WishModel withdrawThirdWishWithParament:dic success:^(NSDictionary *dic) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([dic[@"code"] isEqualToString:NormalStatus]) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"撤回成功" duration:MBProgressHUDDuration];
            [self.navigationController popViewControllerAnimated:YES];
            [self.delegate refreshWishDetailView];
        }else{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
        }
    } withFailureBlock:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return 112;
    }else if (count >= 4 & count < 8){
        return 224 + 8;
    }else{
        return 336 + 16;
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
