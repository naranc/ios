//
//  DonateModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DonateModel : NSObject

@property (strong, nonatomic) NSString * createTime;//创建时间

@property (strong, nonatomic) NSNumber * initiatorId;//作者ID

@property (strong, nonatomic) NSString * initiatorImg;//作者头像

@property (strong, nonatomic) NSString * initiatorNike;//作者昵称

@property (strong, nonatomic) NSString * orderContent;//订单内容

@property (strong, nonatomic) NSNumber * orderId; //订单ID

@property (strong, nonatomic) NSString * orderImgs;//图片s

@property (strong, nonatomic) NSString * orderTitle;//标题

@property (strong, nonatomic) NSString * orderType;//订单类型wish

@property (strong, nonatomic) NSString * province;//省

@property (strong, nonatomic) NSString * city;//市

@property (strong, nonatomic) NSString * county;//区

@property (strong, nonatomic) NSArray * questionnaireOptions;//标签

@property (strong, nonatomic) NSString * typeName;

@property (strong, nonatomic) NSString * updateTime;//更新时间

@property (strong, nonatomic) NSString * mailStatus;//订单邮递状态

@property (strong, nonatomic) NSNumber * collectionTimes;//收藏数量

@property (strong, nonatomic) NSNumber * commentTimes;//评论数量

@property (strong, nonatomic) NSString * mailCode;//快递单号

/****
 *INITIAL    待匹配
 *GOING      匹配中
 *WAITING    等待中
 *SUCCESS    匹配成功
 *REVOKE     撤回
 *FAIL       匹配失败
 ****/
@property (strong, nonatomic) NSString * orderStatus;//订单状态




//捐赠列表
+(void)getDonateListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//捐赠详情
+(void)getDonateDetailWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//撤回捐赠
+(void)withdrawDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//不需要次捐赠  撤回
+(void)withdrawThirdDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//确认需要此捐赠
+(void)confirmTisDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//需要此捐赠的人的列表
+(void)needTisDonateListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;


//申请此捐赠
+(void)needTisDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//收藏订单
+(void)collectTisDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//捐赠给ta的页面详情
+(void)needDetailDonateWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

@end
