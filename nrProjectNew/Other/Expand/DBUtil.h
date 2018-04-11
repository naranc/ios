//
//  DBUtil.h
//  naran
//
//  Created by 那然 on 2017/4/18.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;
@interface DBUtil : NSObject

+(FMDatabase *)getDB;

@end
