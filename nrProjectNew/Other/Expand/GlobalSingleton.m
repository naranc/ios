//
//  GlobalSingleton.m
//  naran
//
//  Created by 那然 on 2017/3/7.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "GlobalSingleton.h"

@implementation GlobalSingleton

+(instancetype)Singleton{
    static GlobalSingleton *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[GlobalSingleton alloc] init];
    });
    return singleton;
}
- (CGRect )getWidthWithText:(NSString *)text higth:(CGFloat)higth font:(UIFont *)font{
    NSDictionary * textDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(0, higth) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDic context:nil];
    return rect;
}
- (CGRect )getHeigthWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font{
    NSDictionary * textDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDic context:nil];
    return rect;
}
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (NSString *)timeFormatted:(long long)totalSeconds
{
//    NSString *str1=[NSString stringWithFormat:@"%ld",totalSeconds];
//    int x;
//    if (totalSeconds) {
//        x=[[str1 substringToIndex:10] intValue];
//    }
//    NSDate  *date1 = [NSDate dateWithTimeIntervalSince1970:x];
//    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
//    [dateformatter setDateFormat:@"yyyy-MM-dd"];
//    return [dateformatter stringFromDate:date1];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    
    // 获取当前时间的年、月、日
    NSDateComponents *components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
//    NSInteger currentYear = components.year;
//    NSInteger currentMonth = components.month;
//    NSInteger currentDay = components.day;
    
    // 获取消息发送时间的年、月、日
    NSDate *msgDate = [NSDate dateWithTimeIntervalSince1970:totalSeconds/1000.0];
    components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:msgDate];
//    CGFloat msgYear = components.year;
//    CGFloat msgMonth = components.month;
//    CGFloat msgDay = components.day;
    
    // 判断
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    dateFmt.dateFormat = @"yyyy-MM-dd";

//    if (currentYear == msgYear && currentMonth == msgMonth && currentDay == msgDay) {
//        //今天
//        dateFmt.dateFormat = @"HH:mm";
//    }else if (currentYear == msgYear && currentMonth == msgMonth && currentDay-1 == msgDay ){
//        //昨天
//        dateFmt.dateFormat = @"昨天 HH:mm";
//    }else{
//        //昨天以前
//        dateFmt.dateFormat = @"yyyy-MM-dd";
//    }
    
    return [dateFmt stringFromDate:msgDate];
}



- (NSString *)getTimeStr:(long long)timestamp
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    
    // 获取当前时间的年、月、日
    NSDateComponents *components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSInteger currentYear = components.year;
    NSInteger currentMonth = components.month;
    NSInteger currentDay = components.day;
    
    // 获取消息发送时间的年、月、日
    NSDate *msgDate = [NSDate dateWithTimeIntervalSince1970:timestamp/1000.0];
    components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:msgDate];
    CGFloat msgYear = components.year;
    CGFloat msgMonth = components.month;
    CGFloat msgDay = components.day;
    
    // 判断
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    if (currentYear == msgYear && currentMonth == msgMonth && currentDay == msgDay) {
        //今天
        dateFmt.dateFormat = @"HH:mm";
    }else if (currentYear == msgYear && currentMonth == msgMonth && currentDay-1 == msgDay ){
        //昨天
        dateFmt.dateFormat = @"昨天 HH:mm";
    }else{
        //昨天以前
        dateFmt.dateFormat = @"yyyy-MM-dd";
    }
    
    return [dateFmt stringFromDate:msgDate];
}
- (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


- (NSString *)compareCurrentTime:(NSString *)str
{
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
//    timeInterval = timeInterval - 8*60*60;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}


@end
