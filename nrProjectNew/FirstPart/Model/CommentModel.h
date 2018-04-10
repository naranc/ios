//
//  CommentModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>


//一级评论
@interface CommentModel : NSObject

@property (nonatomic, strong) NSString *commentContent;

@property (nonatomic, strong) NSNumber *commentId;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSNumber *initiatorId;

@property (nonatomic, strong) NSString *initiatorImg;

@property (nonatomic, strong) NSString *initiatorNike;

@property (nonatomic, strong) NSArray *subComments;

//获取评论列表
+(void)getCommentListWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

//评论订单
+(void)commentOrderWithParament:(NSDictionary *)parament success:(void (^)(NSDictionary *dic))success withFailureBlock:(requestFailure)failureBlock;

@end

//二级评论
@interface SubComment : NSObject

@property (nonatomic, strong) NSString *commentContent;

@property (nonatomic, strong) NSNumber *commentId;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSNumber *initiatorId;

@property (nonatomic, strong) NSString *initiatorImg;

@property (nonatomic, strong) NSString *initiatorNike;

@property (nonatomic, strong) NSNumber *recipientId;

@property (nonatomic, strong) NSString *recipientNike;

@end
