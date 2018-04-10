//
//  DonateModel.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "DonateModel.h"

@implementation DonateModel

//捐赠列表
+(void)getDonateListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/donation/page";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//捐赠详情
+(void)getDonateDetailWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/donation/detail";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}


//撤回捐赠
+(void)withdrawDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/donation/withdraw";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//不需要此捐赠  撤回
+(void)withdrawThirdDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/donation/withdraw";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//确认需要此捐赠
+(void)confirmTisDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/donation/confirm";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

//需要此捐赠的人的列表
+(void)needTisDonateListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/donation/page";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)needTisDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/donation";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
//收藏订单
+(void)collectTisDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"record/collection/order";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
//捐赠给ta的页面详情
+(void)needDetailDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/apply/detail";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
@end
