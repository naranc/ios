//
//  AidApplyDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/31.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "AidApplyDetailViewController.h"
#import "AidModel.h"

@interface AidApplyDetailViewController ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIButton * giveupButton;

@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UIImageView * topImageView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) ImageTextButton * timeBtn;

@property (nonatomic, strong) ImageTextButton * adressBtn;

@property (nonatomic, strong) ImageTextButton * phoneBtn;

@end

@implementation AidApplyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"援助任务"];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    self.bgView.frame = CGRectMake(0, top + 18, SCREEN_WIDTH, SCREEN_HEIGHT - top - 18 - 49);
    [self.view addSubview:_bgView];
    
    self.giveupButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH/2, 49);
    [self.view addSubview:_giveupButton];
    
    self.doneButton.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 49, SCREEN_WIDTH/2, 49);
    [self.view addSubview:_doneButton];

    self.topImageView.frame = CGRectMake(15, 10, SCREEN_WIDTH - 30, SCREEN_WIDTH - 30 - 46);
    [_bgView addSubview:_topImageView];
    [_topImageView sd_setImageWithURL:[NSURL URLWithString:_aidModel.activityImg] placeholderImage:nil];
    
    self.titleLabel.frame = CGRectMake(15, _topImageView.bottom + 12, SCREEN_WIDTH - 30, 24);
    [_bgView addSubview:_titleLabel];
    _titleLabel.text = _aidModel.activityTitle;


    self.timeBtn.frame = CGRectMake(15, _titleLabel.bottom + 8, SCREEN_WIDTH - 30, 17);
    [_timeBtn setTitle:_timeStr forState:UIControlStateNormal];
    [_bgView addSubview:_timeBtn];

    self.adressBtn.frame = CGRectMake(16.1, _timeBtn.bottom + 12, SCREEN_WIDTH - 32, 17);
    [_adressBtn setTitle:_activityAddress forState:UIControlStateNormal];
    [_bgView addSubview:_adressBtn];
    
    self.phoneBtn.frame = CGRectMake(15, _adressBtn.bottom + 12, SCREEN_WIDTH - 30, 17);
    [_bgView addSubview:_phoneBtn];

    
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UIButton *)giveupButton
{
    if (!_giveupButton) {
        _giveupButton = [UIButton  buttonWithType:UIButtonTypeSystem];
        _giveupButton.backgroundColor = kUIColorFromRGB(0x999999);
        [_giveupButton setTitle:@"放弃任务" forState:UIControlStateNormal];
        _giveupButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_giveupButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        weakify(self);
        [_giveupButton addAction:^(UIButton *btn) {
            [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
            [AidModel operationAidWithParament:@{@"accessToken":[UserModel getUser].accessToken,@"applyId":weakSelf.detailDic[@"applyId"],@"applyStatus":@"FAIL"} success:^(NSDictionary *dic) {
                NSLog(@"failDic = %@",dic);
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                if ([dic[@"code"] isEqualToString:NormalStatus]) {
                    [self.navigationController popViewControllerAnimated:YES];
                    [_delegate refeshAidStatus];
                }else{
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                }
            } withFailureBlock:^(NSError *error) {
                NSLog(@"error = %@",error);
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }];
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _giveupButton;
}
- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton  buttonWithType:UIButtonTypeSystem];
        _doneButton.backgroundColor = MainColor;
        [_doneButton setTitle:@"完成任务" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_doneButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        weakify(self);
        [_doneButton addAction:^(UIButton *btn) {
            [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
            [AidModel operationAidWithParament:@{@"accessToken":[UserModel getUser].accessToken,@"applyId":weakSelf.detailDic[@"applyId"],@"applyStatus":@"SUCCESS"} success:^(NSDictionary *dic) {
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                NSLog(@"successDic = %@",dic);
                if ([dic[@"code"] isEqualToString:NormalStatus]) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                    [_delegate refeshAidStatus];
                }else{
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                }
            } withFailureBlock:^(NSError *error) {
                NSLog(@"error = %@",error);
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}
- (UIImageView *)topImageView
{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.contentMode = UIViewContentModeScaleAspectFill;
        _topImageView.clipsToBounds = YES;
    }
    return _topImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    }
    return _titleLabel;
}
- (ImageTextButton *)timeBtn
{
    if (!_timeBtn) {
        _timeBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _timeBtn.midSpacing = 8;
        _timeBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeBtn.imageSize = CGSizeMake(15, 14);
        [_timeBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _timeBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_timeBtn setImage:[UIImage imageNamed:@"list_icon_jiezhi"] forState:UIControlStateNormal];
    }
    return _timeBtn;
}

- (ImageTextButton *)adressBtn
{
    if (!_adressBtn) {
        _adressBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _adressBtn.midSpacing = 8;
        _adressBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _adressBtn.imageSize = CGSizeMake(14, 16);
        [_adressBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _adressBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_adressBtn setImage:[UIImage imageNamed:@"list_icon_weizhi"] forState:UIControlStateNormal];
    }
    return _adressBtn;
}

- (ImageTextButton *)phoneBtn
{
    if (!_phoneBtn) {
        _phoneBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _phoneBtn.midSpacing = 8;
        _phoneBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _phoneBtn.imageSize = CGSizeMake(10.2, 13.2);
        [_phoneBtn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _phoneBtn.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_phoneBtn setImage:[UIImage imageNamed:@"list_icon_lianxifangshi"] forState:UIControlStateNormal];
    }
    return _phoneBtn;
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
