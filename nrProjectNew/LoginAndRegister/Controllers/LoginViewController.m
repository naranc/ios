//
//  LoginViewController.m
//  naran
//
//  Created by 那然 on 2017/3/7.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "LoginViewController.h"
#import "ResetPasswordViewController.h"
#import "RegisterViewController.h"
#import "InputView.h"
#import "Utils.h"

@interface LoginViewController ()<UINavigationControllerDelegate>
{
    InputView * phone;
    InputView * passWord;
    ImageTextButton *forgotPasswordBtn;
}
@property (nonatomic, strong) UIImageView * leftView;

@property (nonatomic, strong) UILabel * thirdLoginLabel;

@property (nonatomic, strong) UIImageView * rightView;

@property (nonatomic, strong) ImageTextButton *qqLoginbtn;

@property (nonatomic, strong) ImageTextButton *weiboLoginbtn;

@property (nonatomic, strong) ImageTextButton *wechatLoginbtn;

@end

@implementation LoginViewController
- (void)viewWillAppear:(BOOL)animated
{

}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自身控制器
    BOOL isShowMyController = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowMyController animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationLoginSuccess" object:nil];

    UIImageView * logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 113)/2, 90, 113, 130)];
    logoImageView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoImageView];
    
    [self loadInputView];
    
    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(SCREEN_WIDTH - 16 - 34, 26, 34, 34);
    [cancelButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cancelButton];
    [cancelButton addAction:^(UIButton *btn) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    if ([WRNavigationBar isIphoneX]) {
        cancelButton.frame = CGRectMake(SCREEN_WIDTH - 16 - 34, 50, 34, 34);
    }
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(60, passWord.bottom + 30, SCREEN_WIDTH - 120, 41);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:18];
    [loginBtn setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    loginBtn.backgroundColor = MainColor;
    [loginBtn setBackgroundImage:[[GlobalSingleton Singleton] imageWithColor:kUIColorFromRGB(0x000000) size:CGSizeMake(SCREEN_WIDTH - 40, 41)] forState:UIControlStateHighlighted];
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 4.0f;
    [self.view addSubview:loginBtn];
    [loginBtn addAction:^(UIButton *btn) {
        [self login];
//        [btn setImage:[[GlobalSingleton Singleton] imageWithColor:kUIColorFromRGBWithAlpha(0x00A780, 0.5) size:CGSizeMake(btn.width, btn.height)] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[[GlobalSingleton Singleton] imageWithColor:kUIColorFromRGB(0x000000) size:CGSizeMake(btn.width, btn.height)] forState:UIControlStateHighlighted];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
   
    
    forgotPasswordBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
    forgotPasswordBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 24 - 68, loginBtn.bottom + 15, 68, 20);
    forgotPasswordBtn.midSpacing = 6;
    forgotPasswordBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    forgotPasswordBtn.imageSize = CGSizeMake(6, 12);
    [forgotPasswordBtn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
    forgotPasswordBtn.layoutStyle = ImageTextButtonStyleLeftTitleRightImage;
    [forgotPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgotPasswordBtn setImage:[UIImage imageNamed:@"dlzc_icon_xiangqing"] forState:UIControlStateNormal];
    [self.view addSubview:forgotPasswordBtn];
    [forgotPasswordBtn addAction:^(UIButton *btn) {
        //忘记密码
        ResetPasswordViewController * resetVC = [[ResetPasswordViewController alloc] init];
        [self.navigationController pushViewController:resetVC animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * lineView = [[UIImageView alloc] initWithFrame:CGRectMake(forgotPasswordBtn.right + 24, loginBtn.bottom + 18, 2, 15)];
    lineView.image = [UIImage imageNamed:@"dlzc_line"];
    [self.view addSubview:lineView];
    
    ImageTextButton *registerBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(lineView.right + 24, loginBtn.bottom + 15, 68, 20);
    registerBtn.midSpacing = 6;
    registerBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    registerBtn.imageSize = CGSizeMake(6, 12);
    [registerBtn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
    registerBtn.layoutStyle = ImageTextButtonStyleLeftTitleRightImage;
    [registerBtn setTitle:@"点击注册" forState:UIControlStateNormal];
    [registerBtn setImage:[UIImage imageNamed:@"dlzc_icon_xiangqing"] forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    [registerBtn addAction:^(UIButton *btn) {
        //忘记密码
        RegisterViewController * registerVC = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:registerVC animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.thirdLoginLabel];
    [self.view addSubview:self.rightView];
    
    [self.view addSubview:self.qqLoginbtn];
    [self.view addSubview:self.weiboLoginbtn];
    [self.view addSubview:self.wechatLoginbtn];
}

/***
    * 加载输入框
 ***/
- (void)loadInputView
{
    phone = [[InputView alloc] initWithFrame:CGRectMake(60, 90 + 130 + 40, SCREEN_WIDTH - 120, 54) placeholder:@"手机号码"];
    phone.TF.keyboardType = UIKeyboardTypeNumberPad;
    phone.isPhoneTF = YES;
    phone.label.textColor = kUIColorFromRGB(0x333333);
    [phone.TF setValue:kUIColorFromRGB(0x333333) forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:phone];
    
    passWord = [[InputView alloc] initWithFrame:CGRectMake(60, phone.bottom, SCREEN_WIDTH - 120, 54) placeholder:@"输入密码"];
    passWord.TF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    passWord.isSecretTF = YES;
    [self.view addSubview:passWord];
}

/***
    * 登录
 ***/
- (void)login
{
    
    if ([phone.TF.text isEqualToString:@""]) {
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PHONETEXTNONE duration:MBProgressHUDDuration];
        return;
    }else{
        if (![Utils checkTellNumber:phone.TF.text]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:ERRORPHONENUMBER duration:MBProgressHUDDuration];
            return;
        }
    }
    if ([passWord.TF.text isEqualToString:@""]) {
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PASSWORDNONE duration:MBProgressHUDDuration];
        return;
    }
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserModel loginWithUserName:phone.TF.text passWord:[passWord.TF.text MD5].lowercaseString success:^(NSDictionary *dic) {
        NSLog(@"loginUserDic  ======  %@",dic);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString * code = dic[@"code"];
        if ([code isEqualToString:NormalStatus]) {
            NSLog(@"userBody = %@",dic[@"data"]);
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"登录成功" duration:MBProgressHUDDuration];
            UserModel *user = [UserModel mj_objectWithKeyValues:dic[@"data"]];
            [UserModel saveUser:user];
            [self performSelector:@selector(loginSuccess) withObject:self afterDelay:1.0f];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationLoginSuccess" object:nil];
        }else{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
        }

    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

/***
    * 登录成功
 ***/
- (void)loginSuccess
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (UIImageView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIImageView alloc] init];
        _leftView.image = [UIImage imageNamed:@"dlzc_line2"];
        _leftView.contentMode = UIViewContentModeCenter;
    }
    return _leftView;
}

- (UILabel *)thirdLoginLabel
{
    if (!_thirdLoginLabel) {
        _thirdLoginLabel = [[UILabel alloc] init];
        _thirdLoginLabel.text = @"使用社交账号登录";
        _thirdLoginLabel.textColor = kUIColorFromRGB(0x666666);
        _thirdLoginLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _thirdLoginLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _thirdLoginLabel;
}

- (UIImageView *)rightView
{
    if (!_rightView) {
        _rightView = [[UIImageView alloc] init];
        _rightView.image = [UIImage imageNamed:@"dlzc_line2"];
        _rightView.contentMode = UIViewContentModeCenter;
    }
    return _rightView;
}
- (ImageTextButton *)qqLoginbtn
{
    if (!_qqLoginbtn) {
        
        _qqLoginbtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _qqLoginbtn.midSpacing = 0.3;
        _qqLoginbtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _qqLoginbtn.imageSize = CGSizeMake(35.7, 35.7);
        [_qqLoginbtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _qqLoginbtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_qqLoginbtn setTitle:@"QQ" forState:UIControlStateNormal];
        [_qqLoginbtn setImage:[UIImage imageNamed:@"dlzc_icon_qq"] forState:UIControlStateNormal];
        [_qqLoginbtn addAction:^(UIButton *btn) {
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqLoginbtn;
}

- (ImageTextButton *)weiboLoginbtn
{
    if (!_weiboLoginbtn) {
        _weiboLoginbtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _weiboLoginbtn.midSpacing = 0.3;
        _weiboLoginbtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _weiboLoginbtn.imageSize = CGSizeMake(35.7, 35.7);
        [_weiboLoginbtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _weiboLoginbtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_weiboLoginbtn setTitle:@"微博" forState:UIControlStateNormal];
        [_weiboLoginbtn setImage:[UIImage imageNamed:@"dlzc_icon_weibo"] forState:UIControlStateNormal];
        [_weiboLoginbtn addAction:^(UIButton *btn) {
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _weiboLoginbtn;
}


- (ImageTextButton *)wechatLoginbtn
{
    if (!_wechatLoginbtn) {
        _wechatLoginbtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _wechatLoginbtn.midSpacing = 0.3;
        _wechatLoginbtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _wechatLoginbtn.imageSize = CGSizeMake(35.7, 35.7);
        [_wechatLoginbtn setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _wechatLoginbtn.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_wechatLoginbtn setTitle:@"微信" forState:UIControlStateNormal];
        [_wechatLoginbtn setImage:[UIImage imageNamed:@"dlzc_icon_wechat"] forState:UIControlStateNormal];
        [_wechatLoginbtn addAction:^(UIButton *btn) {
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _wechatLoginbtn;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    CGFloat left = (SCREEN_WIDTH - (40*2 + 17 + 112)) / 2;
    
    _leftView.frame = CGRectMake(left, forgotPasswordBtn.bottom + 30, 40, 20);
    
    _thirdLoginLabel.frame = CGRectMake(_leftView.right + 8.5, forgotPasswordBtn.bottom + 30, 112, 20);
    
    _rightView.frame = CGRectMake(_thirdLoginLabel.right + 8.5, forgotPasswordBtn.bottom + 30, 40, 20);

    
    CGFloat left1 = (SCREEN_WIDTH - (35.7*3 + 40.3*2)) / 2;

    _qqLoginbtn.frame = CGRectMake(left1, _leftView.bottom + 16, 35.7, 56);
    
    _weiboLoginbtn.frame = CGRectMake(_qqLoginbtn.right + 40.3, _leftView.bottom + 16, 35.7, 56);

    _wechatLoginbtn.frame = CGRectMake(_weiboLoginbtn.right + 40.3, _leftView.bottom + 16, 35.7, 56);

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***
    * 点击页面空白处
 ***/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [phone.TF resignFirstResponder];
    [passWord.TF resignFirstResponder];
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
