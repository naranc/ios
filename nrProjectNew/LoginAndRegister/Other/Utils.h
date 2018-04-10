//
//  Utils.h
//  naran
//
//  Created by 那然 on 2017/3/9.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//#pragma 正则匹配手机号
+ (BOOL)checkTellNumber:(NSString *)tellNumber;

//#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password;

//#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName:(NSString *)userName;

//#pragma 正则匹配用户身份证号
+ (BOOL)checkUserIdCard:(NSString *)idCard;

//#pragma 正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber:(NSString *)number;

//#pragma 正则匹配URL
+ (BOOL)checkURL:(NSString *)url;

@end
