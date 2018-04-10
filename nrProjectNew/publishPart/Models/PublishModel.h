//
//  PublishModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublishModel : NSObject

+(void)pushlishWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)getWishBgImageWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)pushlishDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)getDonateQuestionsWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//我与订单的状态
+(void)getOrderStatusWithMeParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


@end
