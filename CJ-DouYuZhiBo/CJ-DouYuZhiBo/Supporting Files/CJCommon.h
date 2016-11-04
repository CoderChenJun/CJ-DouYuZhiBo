//
//  CJCommon.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#ifndef CJCommon_h
#define CJCommon_h


#endif /* CJCommon_h */












#define ThemeColor [UIColor colorWithRed:(86)/255.0 green:(171)/255.0 blue:(228)/255.0 alpha:1.0]

//#define ThemeFont @"Helvetica-Bold"
#define ThemeFont @"Helvetica Neue"




// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.RGB颜色
#define CJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CJColorWithalpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]


// 3.自定义Log
#ifdef DEBUG
#define CJLog(...) NSLog(__VA_ARGS__)
#else
#define CJLog(...)
#endif

// 4.是否为4英寸

#define IS_IPHONE4S (([[UIScreen mainScreen] bounds].size.height == 480) ? YES : NO)
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)
#define IS_IPHONE6 (([[UIScreen mainScreen] bounds].size.height == 667) ? YES : NO)
#define IS_IPHONE6plus (([[UIScreen mainScreen] bounds].size.height == 736) ? YES : NO)





#define CJStatusBarH 20
#define CJNavigationBarH 44

#define CJUIScreenW [UIScreen mainScreen].bounds.size.width
#define CJUIScreenH [UIScreen mainScreen].bounds.size.height














