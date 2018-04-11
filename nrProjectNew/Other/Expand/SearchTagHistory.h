//
//  SearchTagHistory.h
//  naran
//
//  Created by 那然 on 2017/4/18.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TagModel;

@interface SearchTagHistory : NSObject

@property (strong, nonatomic)NSString * tag;

//创建一条信息
+(void)insertMessageContent:(NSString *)tag;

//得到所有的信息
+(NSMutableArray *)getAllMessageContent;

//删除一条信息
+(void)deleteInspectContent:(NSString *)tag;

//更新一条数据
+(void)updateMessageContent:(NSString *)tag;


@end
