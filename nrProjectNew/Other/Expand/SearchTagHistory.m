//
//  SearchTagHistory.m
//  naran
//
//  Created by 那然 on 2017/4/18.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "SearchTagHistory.h"
#import "TagModel.h"
#import "DBUtil.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation SearchTagHistory

//创建表
+(void)creatTable
{
    FMDatabase *_db = [DBUtil getDB];
    if (![_db open]) {
        NSAssert(NO, @"数据库打开失败，错误信息%@",[_db lastErrorMessage]);
    }
    //创建消息表，存储消息对象///修改
    if (![_db executeUpdate:@"CREATE TABLE IF NOT EXISTS SearchTagTable (id INTEGER PRIMARY KEY,tagStr TEXT)"]) {
        NSLog(@"数据表创建失败");
    }
}
//创建一条信息
+(void)insertMessageContent:(NSString *)tag
{
    FMDatabase *_db = [DBUtil getDB];
    if (![_db open]) {
        NSAssert(NO, @"数据库打开失败");
    }
    if (![_db tableExists:@"NoticeMessageContentTablez"]) {
        [self creatTable];
    }
    [_db setShouldCacheStatements:YES];
    
    if (![_db executeUpdate:@"INSERT INTO SearchTagTable (tagStr) VALUES (?)",tag]) {
        NSLog(@"插入一条考察内容信息失败 %@",[_db lastErrorMessage]);
    }
    
    [_db close];
}
+(void)updateMessageContent:(NSString *)tag
{
    FMDatabase *_db = [DBUtil getDB];
    if (![_db open]) {
        NSAssert(NO, @"数据库打开失败");
    }
    
    if (![_db tableExists:@"SearchTagTable"]) {
        [self creatTable];
    }
    [_db setShouldCacheStatements:YES];
    
    
    if (![_db executeUpdate:@"UPDATE SearchTagTable set tagStr = ? WHERE tagStr = ?",tag,tag]) {
        NSLog(@"更新内容失败 %@",[_db lastErrorMessage]);
    }
    
    [_db close];
}
//得到所有的信息
+(NSMutableArray *)getAllMessageContent
{
    FMDatabase *db = [DBUtil getDB];
    if (![db open]) {
        NSAssert(NO, @"数据库打开失败");
    }

    if (![db tableExists:@"SearchTagTable"]) {
        return nil;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    FMResultSet *rs = [db executeQuery:@"select *from SearchTagTable"];
    while ([rs next]) {
        NSString * tagStr = [rs stringForColumn:@"tagStr"];
        [array addObject:tagStr];
    }
    [rs close];
    [db close];
    return array;
}
//删除一条信息
+(void)deleteInspectContent:(NSString *)tag
{
    NSLog(@"删除一条信息");
    FMDatabase *db = [DBUtil getDB];
    if (![db open]) {
        NSAssert(NO, @"数据库打开失败");
        NSLog(@"数据库打开失败");
    }
    if (![db tableExists:@"SearchTagTable"]) {
        return;
        NSLog(@"存在这个表");
    }
    [db setShouldCacheStatements:YES];
    if ([db executeUpdate:@"DELETE FROM SearchTagTable WHERE tagStr = ?",tag]) {
        NSLog(@"从这个表删除");
    }
    [db close];
}

@end
