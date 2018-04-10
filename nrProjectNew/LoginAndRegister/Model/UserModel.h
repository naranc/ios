//
//  UserModel.h
//  naran
//
//  Created by 那然 on 2017/3/7.
//  Copyright © 2017年 那然. All rights reserved.
//

//#import <JSONModel/JSONModel.h>
#import "AFNetworkingUtil.h"

@interface UserModel : NSObject


@property (strong, nonatomic) NSString * accessToken;

@property (strong, nonatomic) NSNumber * accountId;

@property (strong, nonatomic) NSString * birthday;

@property (strong, nonatomic) NSString * city;

@property (strong, nonatomic) NSString * location;

@property (strong, nonatomic) NSString * sex;

@property (strong, nonatomic) NSString * nickName;

@property (strong, nonatomic) NSString * phone;

@property (strong, nonatomic) NSString * certificationType;



//待添加
@property (strong, nonatomic) NSString * createTime;

@property (strong, nonatomic) NSString * gradeName;

@property (strong, nonatomic) NSString * lastLoginTime;

@property (strong, nonatomic) NSString * password;

@property (strong, nonatomic) NSString * superTitle;

@property (strong, nonatomic) NSString * userGrade;

@property (strong, nonatomic) NSString * userNickname;

@property (strong, nonatomic) NSString * userPhotoUrl;

@property (strong, nonatomic) NSString * userResume;

@property (strong, nonatomic) NSString * userId;


//用户注册
+(void)registerCoubntWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//用户登录
+(void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//获取验证码
+(void)getCodeWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//设置新密码
+(void)setNewPasswordWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//设置用户信息
+(void)setUserInfoWithUrl:(NSString *)urlStr parament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//上传身份证信息
+(void)postIdCardInfomationWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//登出
+(void)logOutSuccess:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//保存登录用户的信息
+(void)saveUser:(UserModel *)user;

//获取已经登录的用户信息
+(UserModel *)getUser;

//删除登录用户的信息
+(void)deleteUser;

@end
