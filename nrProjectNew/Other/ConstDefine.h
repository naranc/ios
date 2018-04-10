//
//  ConstDefine.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/8.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#ifndef ConstDefine_h
#define ConstDefine_h


#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define K_W ([[UIScreen mainScreen]bounds].size.width) * ([UIScreen mainScreen].scale)

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kUIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define weakify(var)   __weak typeof(var) weakSelf = var
#define strongify(var) __strong typeof(var) strongSelf = var


/***
 * App首次打开
 ***/
#define IsFirstTimeLaunch @"IsFirstTimeLaunch"


/***
 * App主要用到的颜色
 ***/
#define MainColor kUIColorFromRGB(0x4FCD9E)
#define BackGroundColor kUIColorFromRGB(0xF5F5F5)



/***
 * 提示框显示的时间s
 ***/
#define MBProgressHUDDuration 1.0f


/***
 * 获取屏幕 宽度、高度
 ***/
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_SCALE   [[UIScreen mainScreen] scale]


#define NRCFBundleShortVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/***
 * 服务器返回状态码
 ***/
#define NormalStatus @"0000"

#define CommentRow 10
#define CommentContentFont [UIFont fontWithName:@"PingFangSC-Regular" size:14]
#define CommentConentWight SCREEN_WIDTH - 67 - 60
/***
 * 输入框提示语
 ***/
#define REGISTEREDPHONENUMBER @"该手机号码已注册"

#define PHONETEXTNONE @"手机号码不能为空"
#define ERRORPHONENUMBER @"请输入正确的手机号码，检查格式是否有误"

#define CODETEXTNONE @"验证码不能为空"
#define ERRORCODENUMBER @"验证码不正确，请仔细核对"
#define SUCCESSSENDCODENUMBER @"验证码已发送手机机短信"

#define PASSWORDNONE @"密码不能为空"
#define SETPASSWORDSUCCESS @"修改密码成功"

#define PROTOCOLTEXT @"我已阅读并同意《那然公益用户服务协定》"


/***
 * 激光推送Appkey
 ***/
#define JPUSAPPHKEY @"db7062045b9544ecda8a82b4"


#define      NSLOG 1   //"1"是输出 "0"是不输出

//控制版本
#define        dev 1   //开发版本
#define production 0   //正式版本



//版本控制
#if dev //开发版本

#define BaseUrl @"http://118.178.122.9:8082/api" //测试

#define H5BaseUrl @"http://118.178.122.9:8081/h5" //h5

#define UMAppkey @"55f91ed467e58e5c5700396f"

#define ChannelId @"FIR TEST"

#endif



#if production //正式版本

#define BaseUrl @"http://api.naranc.com/rest"

#define H5BaseUrl @"http://h5.naranc.com"

#define UMAppkey @"58c78f3ee88bad2e580003df"

#define ChannelId @"App Store"

#endif


//重写NSLOG...
#if NSLOG

#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil

#endif


#endif /* ConstDefine_h */
