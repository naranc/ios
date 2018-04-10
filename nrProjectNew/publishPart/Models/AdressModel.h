//
//  AdressModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/5.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdressModel : NSObject

@property (strong, nonatomic) NSNumber * accountId;

@property (strong, nonatomic) NSString * createTime;

@property (strong, nonatomic) NSString * province;

@property (strong, nonatomic) NSString * city;

@property (strong, nonatomic) NSString * county;

@property (strong, nonatomic) NSString * mailAddress;

@property (strong, nonatomic) NSNumber * mailId;

@property (strong, nonatomic) NSString * mailName;

@property (strong, nonatomic) NSString * mailPhone;

@property (assign, nonatomic) BOOL nowMail;

+(void)addAdresstWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)getAdressListtWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)setAdressNowWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

+(void)deleteAdressWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

@end
