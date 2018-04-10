//
//  GlobalSingleton.h
//  naran
//
//  Created by 那然 on 2017/3/7.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalSingleton : NSObject

+(instancetype)Singleton;

- (CGRect )getWidthWithText:(NSString *)text higth:(CGFloat)higth font:(UIFont *)font;

- (CGRect )getHeigthWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (NSString *)timeFormatted:(long long)totalSeconds;

- (NSString *)getTimeStr:(long long)timestamp;

- (BOOL)isBlankString:(NSString *)string;

- (NSString *)compareCurrentTime:(NSString *)str;

@end
