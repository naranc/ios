//
//  UserModel.m
//  naran
//
//  Created by 那然 on 2017/3/7.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "UserModel.h"
#define USER @"User"

@implementation UserModel

+(void)registerCoubntWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"account/register";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
    
}

+(void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"account/login";
    NSDictionary * parament = @{@"accountNum":userName,@"password":passWord,@"deviceNo":[[[UIDevice currentDevice] identifierForVendor] UUIDString]};
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)getCodeWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"account/register/verifycode";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

+(void)setNewPasswordWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"credentials/doForgetpw";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)setUserInfoWithUrl:(NSString *)urlStr parament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
        NSLog(@"setUserPhotoMsg = %@",object[@"msg"]);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)postIdCardInfomationWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:@"account/certification" withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
        NSLog(@"certification = %@",object[@"msg"]);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

+(void)logOutSuccess:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
//    NSDictionary * parament = @{@"accessToken":[UserModel getUser].accessToken};
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:@"account/logout" withParaments:nil withSuccessBlock:^(NSDictionary *object) {
        success(object);
        NSLog(@"LogoutMsg = %@",object[@"msg"]);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

+(void)saveUser:(UserModel *)user{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[user mj_JSONString] forKey:USER];
}
+(UserModel *)getUser{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *jsonStr = [[userDefault objectForKey:USER] mj_keyValues];
    return [UserModel mj_objectWithKeyValues:jsonStr];
}
+(void)deleteUser{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:USER];
}
@end
