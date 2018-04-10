//
//  TagModel.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/9.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject

@property (nonatomic, strong) NSString * tagUnSelectImageStr;

@property (nonatomic, strong) NSString * tagSelectImageStr;

@property (nonatomic, strong) NSString * tagText;

@property (nonatomic, assign) BOOL isSelect;

@end
