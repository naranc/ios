//
//  CommentModel.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"subComments" : @"records.comments"};
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"subComments" : @"SubComment"};
}
+(void)getCommentListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"record/comment/order/page";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

+(void)commentOrderWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock
{
    NSString * urlStr = @"record/comment/order";
    [AFNetworkingUtil requestWithType:HttpRequestTypePost withUrlString:urlStr withParaments:parament withSuccessBlock:^(NSDictionary *object) {
        success(object);
    } withFailureBlock:^(NSError *error) {
        failureBlock(error);
    } progress:^(float progress) {
        NSLog(@" progress = %f",progress);
    }];
}

@end


@implementation SubComment

@end
