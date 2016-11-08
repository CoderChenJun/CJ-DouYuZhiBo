//
//  NSDate+CJ.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "NSDate+CJ.h"

@implementation NSDate (CJ)



+ (NSString *)getCurrentTimeFrom1970
{
    NSDate *nowDate = [NSDate date];
    NSTimeInterval interval = [nowDate timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%.0f",interval];
    
}




/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
    
}





/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    // 2016-06-01 08:49:23 ---> 2016-06-01
    // 2016-05-31 22:27:46 ---> 2016-05-31
    
    
    
    // 当前时间 2016-06-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 发送时间 2016-05-31
    NSDate *selfDate = [self dateWithYMD];
    
    
    // 获得nowDate与selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.day == 1;
    
}





/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}




/**
 *  返回一个只有 年月日 的时间
 */
- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}






/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];// 当前时间日历
    NSDate *now = [NSDate date];
    
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self toDate:now options:0];
    
    
    // self : 2016-06-01 17:04:04
    // now  : 2016-06-01 19:27:38
    // return 2h 23m 34s
}




@end
