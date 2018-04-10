//
//  SellerAffirmViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/23.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SellerAffirmViewController.h"
#import "SelectAdressTableViewCell.h"
#import "AdressModel.h"
#import "DonateModel.h"
#import "DonateDetaiViewController.h"

@interface SellerAffirmViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView * sendBgView;

@property (nonatomic, strong) UIImageView * sendImageView;

@property (nonatomic, strong) UILabel * sendLabel;





@property (nonatomic, strong) UIView * scanBgView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UITextField * inputWBTF;

@property (nonatomic, strong) UIButton * scanButton;

@property (nonatomic, strong) UIButton * saveButton;


@end

@implementation SellerAffirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"确认信息"];
    AdressModel *adressModel = [AdressModel mj_objectWithKeyValues:_applyDic];
    NSLog(@"%@=%@=%@=%@=%@=%@",
      adressModel.province,
      adressModel.city,adressModel.county,adressModel.mailAddress,adressModel.mailName,adressModel.mailPhone);
    NSString * adressString = [NSString stringWithFormat:@"    %@%@%@%@",adressModel.province,adressModel.city,adressModel.county,adressModel.mailAddress];
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:adressString width:SCREEN_WIDTH - 15 - 74 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    SelectAdressTableViewCell * cell = [[SelectAdressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.frame = CGRectMake(0, top, SCREEN_WIDTH, 12 + 52 + rect.size.height + 15);
    [cell configCellWithModel:adressModel indexPath:nil];
    [self.view addSubview:cell];
    

    self.sendBgView.frame = CGRectMake(0, cell.bottom + 8, SCREEN_WIDTH, 175);
    [self.view addSubview:_sendBgView];
    CGFloat imageWight = 157 * 93 / 172;
    
    self.sendImageView.frame = CGRectMake((SCREEN_WIDTH - imageWight)/2, 12, imageWight, 93);
    [_sendBgView addSubview:_sendImageView];
    
    self.sendLabel.frame = CGRectMake((SCREEN_WIDTH - 240)/2, _sendImageView.bottom + 16, 240, 42);
    [_sendBgView addSubview:_sendLabel];
    
    self.scanBgView.frame =  CGRectMake(0, _sendBgView.bottom + 8, SCREEN_WIDTH, 46);
    [self.view addSubview:_scanBgView];
    
    self.titleLabel.frame = CGRectMake(15, 12, 50, 22);
    [_scanBgView addSubview:_titleLabel];
    
    self.inputWBTF.frame = CGRectMake(80, 13, SCREEN_WIDTH - 160, 20);
    [_scanBgView addSubview:_inputWBTF];
    
    self.scanButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 40, 3, 40, 40);
    [_scanBgView addSubview:_scanButton];
    
    self.saveButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    [self.view addSubview:_saveButton];

    

}

- (UIView *)sendBgView
{
    if (!_sendBgView) {
        _sendBgView = [[UIView alloc] init];
        _sendBgView.userInteractionEnabled = YES;
        _sendBgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _sendBgView;
}
- (UIImageView *)sendImageView
{
    if (!_sendImageView) {
        _sendImageView = [[UIImageView alloc] init];
        _sendImageView.image = [UIImage imageNamed:@"icon_kuaiqufahuo"];
    }
    return _sendImageView;
}
- (UILabel *)sendLabel
{
    if (!_sendLabel) {
        _sendLabel = [[UILabel alloc] init];
        _sendLabel.text = @"快去发货吧，请最好在三天内寄出快  递并上传运单号，有人在等你哦";
        _sendLabel.numberOfLines = 0;
        _sendLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _sendLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _sendLabel;
}

- (UIView *)scanBgView
{
    if (!_scanBgView) {
        _scanBgView = [[UIView alloc] init];
        _scanBgView.userInteractionEnabled = YES;
        _scanBgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _scanBgView;
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
        _inputWBTF.delegate = self;
        _inputWBTF.returnKeyType = UIReturnKeyDone;
        _inputWBTF.tintColor = MainColor;
    }
    return _inputWBTF;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
            //捐赠的发货单
            NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken,@"mailCode":_inputWBTF.text,@"applyId":_applyDic[@"applyId"]};
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
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
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
