//
//  AidModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/30.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AidModel : NSObject

@property (nonatomic, strong) NSNumber * activityId;

@property (nonatomic, strong) NSString * activityImg;

@property (nonatomic, strong) NSString * activityTitle;

@property (nonatomic, strong) NSString * createTime;

@property (nonatomic, strong) NSNumber * commentTimes;

@property (nonatomic, strong) NSNumber * realApplyTimes;

@property (nonatomic, strong) NSNumber * shareTimes;

+(void)getAidDtataWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)getAidStatusWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)applyAidWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)myApplyStatusWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)operationAidWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

@end
