//
//  InputWayNumberViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "InputWayNumberViewController.h"
#import "DonateModel.h"
#import "WishModel.h"
#import "WishDetailViewController.h"
#import "DonateDetaiViewController.h"
@interface InputWayNumberViewController ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UITextField * inputWBTF;

@property (nonatomic, strong) UIButton * scanButton;

@property (nonatomic, strong) UIButton * saveButton;

@end

@implementation InputWayNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"运单号输入"];
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.saveButton];
    [_bgView addSubview:self.titleLabel];
    [_bgView addSubview:self.inputWBTF];
    [_bgView addSubview:self.scanButton];

}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.userInteractionEnabled = YES;
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"运单号";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}
- (UIButton *)scanButton
{
    if (!_scanButton) {
        _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_scanButton setImage:[UIImage imageNamed:@"icon_saoyisao"] forState:UIControlStateNormal];
        [_scanButton addAction:^(UIButton *btn) {
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanButton;
}
- (UITextField *)inputWBTF
{
    if (!_inputWBTF) {
        _inputWBTF = [[UITextField alloc] init];
        _inputWBTF.placeholder = @"请输入或扫描运单号";
        _inputWBTF.textColor = kUIColorFromRGB(0x999999);
        _inputWBTF.textAlignment = NSTextAlignmentCenter;
        _inputWBTF.tintColor = MainColor;
    }
    return _inputWBTF;
}
- (UIButton *)saveButton
{
    if (!_saveButton) {
        _saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_saveButton setTitle:@"确定" forState:UIControlStateNormal];
        [_saveButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _saveButton.backgroundColor = MainColor;
        weakify(self);
        [_saveButton addAction:^(UIButton *btn) {
            //确认需要此捐赠
            if ([_inputWBTF.text isEqualToString:@""] || _inputWBTF.text.length == 0) {
                [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"请输入运单号" duration:MBProgressHUDDuration];
                return;
            }else{
                NSString *str = [_inputWBTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
                if ([str isEqualToString:@""] || str.length == 0) {
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"请输入运单号" duration:MBProgressHUDDuration];
                    _inputWBTF.text = @"";
                    return;
                }
            }
            
            
            
            if ([_byWayType isEqualToString:@"DONATE"]) {
                
                //捐赠的发货单
                NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken,@"mailCode":_inputWBTF.text,@"applyId":_applyId};
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                [DonateModel confirmTisDonateWithParament:parament success:^(NSDictionary *dic) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                    if ([dic[@"code"] isEqualToString:NormalStatus]) {
                        [self.navigationController popViewControllerAnimated:YES];
                        DonateDetaiViewController * vc = self.navigationController.viewControllers[2];
                        [self.navigationController popToViewController:vc animated:NO];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"InputWayNumberSuccess1" object:nil];
                    }
                } withFailureBlock:^(NSError *error) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                }];
                
            }else{
               
                //心愿的发货单
                NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken,@"mailCode":_inputWBTF.text,@"orderId":_orderId};
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                [WishModel deliverWishWithParament:parament success:^(NSDictionary *dic) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                    if ([dic[@"code"] isEqualToString:NormalStatus]) {
                        [self.navigationController popViewControllerAnimated:YES];
                        WishDetailViewController * vc = self.navigationController.viewControllers[2];
                        [self.navigationController popToViewController:vc animated:NO];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"InputWayNumberSuccess" object:nil];
                    }
                } withFailureBlock:^(NSError *error) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                }];
                
            }
            
            
            
           
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

    _bgView.frame = CGRectMake(0, top + 12, SCREEN_WIDTH, 46);
    
    _saveButton.frame = CGRectMake(15, _bgView.bottom + 16, SCREEN_WIDTH - 30, 38);
    
    _titleLabel.frame = CGRectMake(15, 12, 50, 22);

    _inputWBTF.frame = CGRectMake(80, 13, SCREEN_WIDTH - 160, 20);
    
    _scanButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 40, 3, 40, 40);
    
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
