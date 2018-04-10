//
//  WishModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WishModel : NSObject

@property (strong, nonatomic) NSString * backdropBottomImg;

@property (strong, nonatomic) NSString * commodityType;

@property (strong, nonatomic) NSString * mailAddress;

@property (strong, nonatomic) NSString * mailName;

@property (strong, nonatomic) NSString * mailPhone;

@property (strong, nonatomic) NSString * mailCode;//快递单号

@property (strong, nonatomic) NSString * mailStatus;//订单邮递状态

@property (strong, nonatomic) NSString * createTime;//创建时间

@property (strong, nonatomic) NSNumber * initiatorId;//作者ID

@property (strong, nonatomic) NSString * initiatorImg;//作者头像

@property (strong, nonatomic) NSString * initiatorNike;//作者昵称

@property (strong, nonatomic) NSString * orderContent;//订单内容

@property (strong, nonatomic) NSNumber * orderId; //订单ID

@property (strong, nonatomic) NSString * orderImgs;//图片s

@property (strong, nonatomic) NSString * orderTitle;//标题

@property (strong, nonatomic) NSString * orderType;//订单类型wish

@property (strong, nonatomic) NSString * updateTime;//更新时间

@property (strong, nonatomic) NSString * province;//省

@property (strong, nonatomic) NSString * city;//市

@property (strong, nonatomic) NSString * county;//区

@property (strong, nonatomic) NSString * readTimes;//阅读次数

@property (assign, nonatomic) BOOL willing;


/****
 *INITIAL    待匹配
 *GOING      匹配中
 *WAITING    等待中
 *SUCCESS    匹配成功
 *REVOKE     撤回
 *FAIL       匹配失败
 ****/
@property (strong, nonatomic) NSString * orderStatus;//订单状态

//订单列表
+(void)getWishListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//订单详情
+(void)getWishDetailWithParament:(NSString *)orderID success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//心愿撤回
+(void)withdrawWishWithParament:(NSString *)orderID success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//心愿确认
+(void)confirmWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//心愿实现
+(void)realizeWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//不想实现他人的心愿 撤回
+(void)withdrawThirdWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//心愿实现 已发货
+(void)deliverWishWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//心愿申请单详情
+(void)getApplyWishDetailWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

@end
