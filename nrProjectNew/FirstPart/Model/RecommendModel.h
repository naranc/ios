//
//  RecommendModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/3/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject

@property (nonatomic, strong) NSString * contentBody;

@property (nonatomic, strong) NSNumber * contentId;

@property (nonatomic, strong) NSString * contentImg;

@property (nonatomic, strong) NSString * contentTitle;

@property (nonatomic, strong) NSString * contentType;

@property (nonatomic, strong) NSString * createTime;

@property (nonatomic, strong) NSString * recommendTime;

+(void)getRecommendDataWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

@end
