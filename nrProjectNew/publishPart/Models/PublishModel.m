//
//  PublishModel.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "PublishModel.h"

@implementation PublishModel

//发布心愿
+(void)pushlishWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/wish";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
//获取发发布心愿的信纸
+(void)getWishBgImageWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/stationery";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
//发布捐赠
+(void)pushlishDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/donation";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)getDonateQuestionsWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"questionnaire/page/5";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
+(void)getOrderStatusWithMeParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"order/with/me";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

@end
