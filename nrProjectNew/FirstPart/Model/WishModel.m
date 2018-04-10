//
//  WishModel.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "WishModel.h"

@implementation WishModel

//心愿列表
+(void)getWishListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/wish/page";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
    
}

//心愿详情
+(void)getWishDetailWithParament:(NSString *)orderID success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/wish/detail";
    NSDictionary * parament = @{@"orderId":orderID};
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//心愿撤回
+(void)withdrawWishWithParament:(NSString *)orderID success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/wish/withdraw";
    NSDictionary * parament = @{@"orderId":orderID,@"accessToken":[UserModel getUser].accessToken};
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//心愿确认
+(void)confirmWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/wish/confirm";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//心愿实现
+(void)realizeWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/wish";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//不想实现他人的心愿 撤回
+(void)withdrawThirdWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/wish/withdraw";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
    
}

//心愿实现 已发货
+(void)deliverWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/wish/deliver";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)getApplyWishDetailWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/wish/detail";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

@end
