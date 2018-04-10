//
//  ResetPasswordViewController.m
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "InputView.h"
#import "ProtocolView.h"
#import "Utils.h"
//#import "NRWebViewController.h"

#define TimerCount 60

@interface ResetPasswordViewController ()<ProtocolViewDelegate>
{
    InputView *phone;
    InputView *newPassword;
    InputView *againPassword;
    InputView *codeNumber;
    NSTimer *registerTimer;
    NSInteger timeCount;
    UIButton * getCodeNumberBtn;
    ProtocolView * protocolView;
}
@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self loadInputView];
    
    UIButton * saveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    saveBtn.frame = CGRectMake(60, codeNumber.bottom + 30, SCREEN_WIDTH - 120, 41);
    [saveBtn setTitle:@"提交" forState:UIControlStateNormal];
    [saveBtn setTintColor:kUIColorFromRGB(0xFFFFFF)];
    saveBtn.backgroundColor = MainColor;
    [saveBtn setBackgroundImage:[[GlobalSingleton Singleton] imageWithColor:kUIColorFromRGB(0x000000) size:CGSizeMake(SCREEN_WIDTH - 40, 44)] forState:UIControlStateHighlighted];
    saveBtn.clipsToBounds = YES;
    saveBtn.layer.cornerRadius = 4.0f;
    [self.view addSubview:saveBtn];
    [saveBtn addAction:^(UIButton *btn) {
        
        //检查各自的输入框
        if ([phone.TF.text isEqualToString:@""]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PHONETEXTNONE duration:MBProgressHUDDuration];
            return;
        }else{
            if (![Utils checkTellNumber:phone.TF.text]) {
//                [MBProgressHUD showHUDAddedTo:self.view animated:YES text:ERRORCODENUMBER duration:MBProgressHUDDuration];
                return;
            }
        }
        if ([newPassword.TF.text isEqualToString:@""]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PASSWORDNONE duration:MBProgressHUDDuration];
            return;
        }
        if ((newPassword.TF.text.length < 6 || newPassword.TF.text.length > 20)) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"密码不能少于6位，多于20位！" duration:MBProgressHUDDuration];
            return;
        }
        if ([againPassword.TF.text isEqualToString:@""]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请重复密码" duration:MBProgressHUDDuration];
            return;
        }
        if ((againPassword.TF.text.length < 6 || againPassword.TF.text.length > 20)) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"密码不能少于6位，多于20位！" duration:MBProgressHUDDuration];
            return;
        }
        if ([codeNumber.TF.text isEqualToString:@""]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:CODETEXTNONE duration:MBProgressHUDDuration];
            return;
        }
        
        if (protocolView.imageButton.isSelected == NO) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请同意协议" duration:MBProgressHUDDuration];
            return;
        }
        
        if (![newPassword.TF.text isEqualToString:againPassword.TF.text]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"两次输入的密码不一样" duration:MBProgressHUDDuration];
            return;
        }

        [self saveNewPassword];

    } forControlEvents:UIControlEventTouchUpInside];
    
    UIFont * font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];

    CGRect rect = [[GlobalSingleton Singleton] getWidthWithText:PROTOCOLTEXT higth:20 font:font];
    CGFloat wight = 16 + 7 + rect.size.width;
    protocolView = [[ProtocolView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - wight)/2, saveBtn.bottom + 24, wight, 20) text:PROTOCOLTEXT];
    protocolView.delegate = self;
    [self.view addSubview:protocolView];
}
-(void)pushWebView
{
//    AboutNRViewController * aboutNRVC = [[AboutNRViewController alloc] init];
//    aboutNRVC.hidesBottomBarWhenPushed = YES;
//    aboutNRVC.titleStr = @"用户协议";
//    NSString * urlStr = [NSString stringWithFormat:@"%@/credentials/protocol",BaseUrl];
//    aboutNRVC.webViewUrlStr = urlStr;
//    [self.navigationController pushViewController:aboutNRVC animated:YES];
}
- (void)loadInputView
{
    CGFloat left = 60;
    CGFloat wight = SCREEN_WIDTH - 2*left;

    phone = [[InputView alloc] initWithFrame:CGRectMake(left, 104, wight, 54) placeholder:@"手机号码"];
    phone.TF.keyboardType = UIKeyboardTypeNumberPad;
    phone.isPhoneTF = YES;
    [self.view addSubview:phone];
    
    newPassword = [[InputView alloc] initWithFrame:CGRectMake(left, phone.bottom, wight, 54) placeholder:@"输入新密码"];
    newPassword.TF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    newPassword.isSecretTF = YES;
    [self.view addSubview:newPassword];
    
    againPassword = [[InputView alloc] initWithFrame:CGRectMake(left, newPassword.bottom, wight, 54) placeholder:@"重复新密码"];
    againPassword.TF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    againPassword.isSecretTF = YES;
    [self.view addSubview:againPassword];
    
    codeNumber = [[InputView alloc] initWithFrame:CGRectMake(left, againPassword.bottom, wight, 54) placeholder:@"验证码"];
    codeNumber.TF.keyboardType = UIKeyboardTypeNumberPad;
    codeNumber.isCodeTF = YES;
    [self.view addSubview:codeNumber];

    getCodeNumberBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    getCodeNumberBtn.frame = CGRectMake(codeNumber.width - 75, (codeNumber.height - 22)/2, 75, 25);
    [getCodeNumberBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    getCodeNumberBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [getCodeNumberBtn setTintColor:kUIColorFromRGB(0xFFFFFF)];
    getCodeNumberBtn.backgroundColor = MainColor;
    getCodeNumberBtn.clipsToBounds = YES;
    getCodeNumberBtn.layer.cornerRadius = 4.0f;
    [codeNumber addSubview:getCodeNumberBtn];
    [getCodeNumberBtn addTarget:self action:@selector(getCodeNumber:) forControlEvents:UIControlEventTouchUpInside];


    
}

/***
    * 提交新密码
 ***/
- (void)saveNewPassword
{
//    NSDictionary * parament = @{@"code":codeNumber.TF.text,@"userPhone":phone.TF.text,@"password":[newPassword.TF.text MD5].lowercaseString};
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [UserModel setNewPasswordWithParament:parament success:^(NSDictionary *dic) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        if ([dic[@"code"] isEqualToString:NormalStatus]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:SETPASSWORDSUCCESS duration:MBProgressHUDDuration];
//            [self performSelector:@selector(backToLogin) withObject:nil afterDelay:1];
//        }else{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
//        }
//
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];

}

/***
    * 重置密码成功
 ***/
- (void)backToLogin
{
    [self.navigationController popViewControllerAnimated:YES];
}

/***
    *获取验证码
 ***/
- (void)getCodeNumber:(UIButton *)btn
{
    
    if ([phone.TF.text isEqualToString:@""]) {
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入手机号" duration:MBProgressHUDDuration];
        return;
    }else{
        if (![Utils checkTellNumber:phone.TF.text]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入正确的手机号码" duration:MBProgressHUDDuration];
            return;
        }
    }
    
    [phone.TF resignFirstResponder];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary * parament = @{@"phone":phone.TF.text, @"exist":@"forgetpw"};

    
    [UserModel getCodeWithParament:parament success:^(NSDictionary *dic) {
        NSLog(@"dic == %@",dic);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString * code = dic[@"code"];
        if ([code isEqualToString:NormalStatus]) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                getCodeNumberBtn.backgroundColor = kUIColorFromRGB(0xCCCCCC);
                
            });
            timeCount = TimerCount;
            registerTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(counter) userInfo:nil repeats:YES];
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:SUCCESSSENDCODENUMBER duration:MBProgressHUDDuration];

        }else{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
        }
    } withFailureBlock:^(NSError *error) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"error = %@",error);
    }];
}

/***
 * 倒计时开始
 ***/
-(void)counter{
    dispatch_async(dispatch_get_main_queue(), ^{
        timeCount--;
        if (timeCount <= 0) {
            [registerTimer invalidate];
            getCodeNumberBtn.enabled = YES;
            [getCodeNumberBtn setTitle:@"重新获取" forState:UIControlStateNormal];
            getCodeNumberBtn.backgroundColor = MainColor;
        }else{
            getCodeNumberBtn.titleLabel.text = [NSString stringWithFormat:@"%lds",(long)timeCount];
            [getCodeNumberBtn setTitle:[NSString stringWithFormat:@"%lds",(long)timeCount] forState:UIControlStateNormal];
            [getCodeNumberBtn setNeedsDisplay];
        }
    });
}

/***
 * 点击页面空白处
 ***/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [phone.TF resignFirstResponder];
    [newPassword.TF resignFirstResponder];
    [againPassword.TF resignFirstResponder];
    [codeNumber.TF resignFirstResponder];

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
