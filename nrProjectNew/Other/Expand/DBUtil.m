//
//  DBUtil.m
//  naran
//
//  Created by 那然 on 2017/4/18.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "DBUtil.h"
#import "FMDatabase.h"

FMDatabase *_db = nil;
@implementation DBUtil
//得到路径
+(NSString *)getDataBasePath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
}

+(FMDatabase *)getDB
{
    if (_db == nil) {
        _db = [[FMDatabase alloc]initWithPath:[self getDataBasePath]];
    }
    return _db;
}

@end
