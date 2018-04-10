//
//  RegisterViewController.m
//  naran
//
//  Created by 那然 on 2017/3/7.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "RegisterViewController.h"
#import "InputView.h"
#import "ProtocolView.h"
#import "Utils.h"
//#import "NRWebViewController.h"
#define TimerCount 60


@interface RegisterViewController ()<ProtocolViewDelegate>
{
    InputView *phone;
    InputView *setPassword;
    InputView *againPassword;
    InputView *codeNumber;
    NSTimer *registerTimer;
    NSInteger timeCount;
    UIButton * getCodeNumberBtn;
    ProtocolView * protocolView;


}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadInputView];
    
    UIButton * registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registerBtn.frame = CGRectMake(60, codeNumber.bottom + 30, SCREEN_WIDTH - 120, 41);
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTintColor:kUIColorFromRGB(0xFFFFFF)];
    registerBtn.backgroundColor = MainColor;
    [registerBtn setBackgroundImage:[[GlobalSingleton Singleton] imageWithColor:kUIColorFromRGB(0x000000) size:CGSizeMake(SCREEN_WIDTH - 40, 44)] forState:UIControlStateHighlighted];

    registerBtn.clipsToBounds = YES;
    registerBtn.layer.cornerRadius = 4.0f;
    [self.view addSubview:registerBtn];
    [registerBtn addAction:^(UIButton *btn) {
        
        
        //检查每个输入框
        if ([phone.TF.text isEqualToString:@""]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PHONETEXTNONE duration:MBProgressHUDDuration];
            return;
        }else{
            if (![Utils checkTellNumber:phone.TF.text]) {
//                [MBProgressHUD showHUDAddedTo:self.view animated:YES text:ERRORPHONENUMBER duration:MBProgressHUDDuration];
                return;
            }
        }
        
        if ([setPassword.TF.text isEqualToString:@""]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PASSWORDNONE duration:MBProgressHUDDuration];
            return;
        }

        if ((setPassword.TF.text.length < 6 || setPassword.TF.text.length > 20)) {
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
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text :@"请同意协议" duration:MBProgressHUDDuration];
            return;
        }
        
        if (![setPassword.TF.text isEqualToString:againPassword.TF.text]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"两次密码不一致，请重新输入" duration:MBProgressHUDDuration];
            return;
        }
        
        [self registerNewCount];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIFont * font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];

    CGRect rect = [[GlobalSingleton Singleton] getWidthWithText:PROTOCOLTEXT higth:20 font:font];
    CGFloat wight = 16 + 7 + rect.size.width;
    protocolView = [[ProtocolView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - wight)/2, registerBtn.bottom + 24, wight, 20) text:PROTOCOLTEXT];
    protocolView.delegate = self;
    [self.view addSubview:protocolView];
    
}
- (void)pushWebView
{
    
//    AboutNRViewController * aboutNRVC = [[AboutNRViewController alloc] init];
//    aboutNRVC.hidesBottomBarWhenPushed = YES;
//    aboutNRVC.titleStr = @"用户协议";
//    NSString * urlStr = [NSString stringWithFormat:@"%@/credentials/protocol",BaseUrl];
//    aboutNRVC.webViewUrlStr = urlStr;
//    [self.navigationController pushViewController:aboutNRVC animated:YES];
//    WebViewController * webView = [[WebViewController alloc] init];
//    UINavigationController * NAVC = [[UINavigationController alloc] initWithRootViewController:webView];
//    webView.navigationController.navigationBar.hidden = NO;
//    webView.isProtocol = YES;
//    [self.navigationController pushViewController:webView animated:YES];
}
- (void)loadInputView
{
    CGFloat left = 60;
    CGFloat wight = SCREEN_WIDTH - 2*left;
    phone = [[InputView alloc] initWithFrame:CGRectMake(left, 104, wight, 54) placeholder:@"手机号码"];
    phone.TF.keyboardType = UIKeyboardTypeNumberPad;
    phone.isPhoneTF = YES;
    [self.view addSubview:phone];
    
    setPassword = [[InputView alloc] initWithFrame:CGRectMake(left, phone.bottom, wight, 54) placeholder:@"设置密码"];
    setPassword.TF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    setPassword.isSecretTF = YES;
    [self.view addSubview:setPassword];
    
    againPassword = [[InputView alloc] initWithFrame:CGRectMake(left, setPassword.bottom, wight, 54) placeholder:@"重复密码"];
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
    getCodeNumberBtn.clipsToBounds = YES;
    getCodeNumberBtn.layer.cornerRadius = 4.0f;
    getCodeNumberBtn.backgroundColor = MainColor;
    [codeNumber addSubview:getCodeNumberBtn];
    [getCodeNumberBtn addTarget:self action:@selector(getCodeNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

/***
    * 点击注册
 ***/
- (void)registerNewCount
{
    NSDictionary * parament = @{@"verifycode":codeNumber.TF.text,@"mobile":phone.TF.text,@"password":[setPassword.TF.text MD5].lowercaseString,@"cPassword":[againPassword.TF.text MD5].lowercaseString,@"username":phone.TF.text};
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserModel registerCoubntWithParament:parament success:^(NSDictionary *dic) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString * code = dic[@"code"];
        NSLog(@"MSG = %@",dic[@"msg"]);
        if ([code isEqualToString:NormalStatus]) {
//            [MobClick event:@"RegisterSuccess"];  App Store 案例编号： 100399798051
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"注册成功" duration:MBProgressHUDDuration];
//            [self performSelector:@selector(backToLogin) withObject:nil afterDelay:0];
            
            
            [UserModel loginWithUserName:phone.TF.text passWord:[setPassword.TF.text MD5].lowercaseString success:^(NSDictionary *dic) {
                NSLog(@"loginUserDic  ======  %@",dic);
                //        [MBProgressHUD hideHUDForView:self.view animated:YES];
                NSString * code = dic[@"code"];
                if ([code isEqualToString:NormalStatus]) {
                    NSLog(@"userBody = %@",dic[@"body"]);
                    //            UserModel * user = [[UserModel alloc] initWithDictionary:dic[@"body"] error:nil];
                    //            [UserModel saveUser:user];
                    //            NSLog(@"user === %@",user);
                    //            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"登录成功" duration:MBProgressHUDDuration];
                    [self dismissViewControllerAnimated:YES completion:nil];
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationLoginSuccess" object:nil];
                }else{
                    //            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
                }
                
            } withFailureBlock:^(NSError *error) {
                NSLog(@"error = %@",error);
                //        [MBProgressHUD hideHUDForView:self.view animated:YES];
            }];
            
            
            
            
        }else{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
/***
    * 注册成功
 ***/
- (void)backToLogin
{
    //注册成后登陆
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [UserModel loginWithUserName:phone.TF.text passWord:[setPassword.TF.text MD5].lowercaseString success:^(NSDictionary *dic) {
//        NSLog(@"loginUserDic  ======  %@",dic);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        NSString * code = dic[@"code"];
//        if ([code isEqualToString:NormalStatus]) {
//            NSLog(@"userBody = %@",dic[@"body"]);
//            UserModel * user = [[UserModel alloc] initWithDictionary:dic[@"body"] error:nil];
//            [UserModel saveUser:user];
//            NSLog(@"user === %@",user);
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"登录成功" duration:MBProgressHUDDuration];
//            [self dismissViewControllerAnimated:YES completion:nil];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationLoginSuccess" object:nil];
//        }else{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:dic[@"msg"] duration:MBProgressHUDDuration];
//        }
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//    }];
    
}

/***
    * 获取验证码
 ***/
- (void)getCodeNumber:(UIButton *)btn
{
    if (phone.TF.text.length == 0) {
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:PHONETEXTNONE duration:MBProgressHUDDuration];
        return;
    }else{
        if (![Utils checkTellNumber:phone.TF.text]) {
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:ERRORPHONENUMBER duration:MBProgressHUDDuration];
            return;
        }
    }
    [phone.TF resignFirstResponder];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary * parament = @{@"mobile":phone.TF.text,@"isTest":@1};
    
    
    [UserModel getCodeWithParament:parament success:^(NSDictionary *dic) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSString * code = dic[@"code"];
        NSLog(@"getCodeNumber.MSG = %@",dic[@"msg"]);
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***
    * 点击页面空白处
 ***/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [phone.TF resignFirstResponder];
    [setPassword.TF resignFirstResponder];
    [againPassword.TF resignFirstResponder];
    [codeNumber.TF resignFirstResponder];
    
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
