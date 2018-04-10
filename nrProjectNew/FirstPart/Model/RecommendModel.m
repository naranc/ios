//
//  RecommendModel.m
//  nrProjectNew
//
//  Created by 那然 on 2018/3/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel


+(void)getRecommendDataWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"content/weekly/recommendation/page";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}
@end
