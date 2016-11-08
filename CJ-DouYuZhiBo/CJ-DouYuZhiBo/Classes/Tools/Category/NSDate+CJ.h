//
//  NSDate+CJ.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CJ)





/**
 *  获取距离1970系统元年的时间差(以秒为单位)
 */
+ (NSString *)getCurrentTimeFrom1970;






/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYesterday;

/**
 *  是否为今年
 */
- (BOOL)isThisYear;


/**
 *  返回一个只有 年月日 的时间
 */
- (NSDate *)dateWithYMD;



/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;



@end
