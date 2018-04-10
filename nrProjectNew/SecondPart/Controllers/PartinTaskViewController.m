//
//  PartinTaskViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/24.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "PartinTaskViewController.h"
#import "AidModel.h"

@interface PartinTaskViewController ()

@property (strong, nonatomic) UIView * topView;

@property (strong, nonatomic) UILabel * titleLabel;

@property (strong, nonatomic) UILabel * contentLabel;

@property (strong, nonatomic) UIView * bottomView;

@property (strong, nonatomic) UILabel * nameLabel;

@property (strong, nonatomic) UITextField * nameTF;

@property (strong, nonatomic) UIImageView * lineView;

@property (strong, nonatomic) UILabel * phoneLabel;

@property (strong, nonatomic) UITextField * phoneTF;

@property (strong, nonatomic) UIButton * subButton;

@end

@implementation PartinTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"援助任务"];
    NSString * contentStr = @"华为刚出nova时，随手机附赠的手机壳，摸上去手感很好，尤其是冬天，带上TA手机拿在手里会觉得很温暖。官方正品，与黑色和白色手机搭配更适合。大冬... ";
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;


    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:contentStr width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:14]];
    
    CGFloat topBgViewHeight = rect.size.height + 20 + 50;
    
    
    self.topView.frame = CGRectMake(0, top + 12, SCREEN_WIDTH, topBgViewHeight);
    [self.view addSubview:_topView];
    
    self.titleLabel.frame = CGRectMake(15, 16, 80, 22);
    [_topView addSubview:_titleLabel];
    
    self.contentLabel.frame = CGRectMake(15, _titleLabel.bottom + 12, SCREEN_WIDTH - 30, rect.size.height);
    _contentLabel.text = contentStr;
    [_topView addSubview:_contentLabel];
    
    
    self.bottomView.frame = CGRectMake(0, _topView.bottom + 12, SCREEN_WIDTH, 94);
    [self.view addSubview:_bottomView];
    
    
    self.nameLabel.frame = CGRectMake(0, 0, 71, 46);
    [_bottomView addSubview:_nameLabel];
    
    self.nameTF.frame = CGRectMake(_nameLabel.right, 9, SCREEN_WIDTH - 71 - 15, 30);
    [_bottomView addSubview:_nameTF];
    
    
    self.lineView.frame = CGRectMake(0, _nameLabel.bottom, SCREEN_WIDTH, 1);
    [_bottomView addSubview:_lineView];
    
    
    self.phoneLabel.frame = CGRectMake(0, _lineView.bottom, 71, 46);
    [_bottomView addSubview:_phoneLabel];
    
    self.phoneTF.frame = CGRectMake(_phoneLabel.right, _lineView.bottom + 9, SCREEN_WIDTH - 71 - 15, 30);
    [_bottomView addSubview:_phoneTF];
    
    
    self.subButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    [self.view addSubview:_subButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _topView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"任务事项:";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        _contentLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _contentLabel;
}
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bottomView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"姓名";
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _nameLabel;
}
- (UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.text = @"电话";
        _phoneLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _phoneLabel.textAlignment = NSTextAlignmentCenter;
        _phoneLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _phoneLabel;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
}

- (UITextField *)nameTF
{
    if (!_nameTF) {
        _nameTF = [[UITextField alloc] init];
        _nameTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameTF.placeholder = @"请填写您的姓名";
    }
    return _nameTF;
}
- (UITextField *)phoneTF
{
    if (!_phoneTF) {
        _phoneTF = [[UITextField alloc] init];
        _phoneTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _phoneTF.placeholder = @"请填写您的联系方式";
    }
    return _phoneTF;
}
- (UIButton *)subButton
{
    if (!_subButton) {
        _subButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_subButton setTitle:@"提交" forState:UIControlStateNormal];
        [_subButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _subButton.backgroundColor = MainColor;
        weakify(self);
        [_subButton addAction:^(UIButton *btn) {
            [weakSelf applyAid];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _subButton;
}
- (void)applyAid
{
    NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken,@"activityId":_aidId,@"name":_nameTF.text,@"phone":_phoneTF.text};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AidModel applyAidWithParament:parament success:^(NSDictionary *dic) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"applyDic = %@",dic)
        if ([dic[@"code"] isEqualToString:NormalStatus]) {
            [self.navigationController popViewControllerAnimated:YES];
            [_delegate partInSuccessRefeshAidStatus];
        }else{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
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
