//
//  UIImage+CJ.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CJ)



/**
 *  加载图片_os7
 *
 *  @param name 图片名
 */
+ (UIImage *)imageWithNamed:(NSString *)name;


/**
 *  返回一张通过最中心点进行拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;


/**
 *  传入百分比,返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;




/**
 *  通过传递颜色 color 生成纯色图片
 */
+(UIImage*)createImageWithColor:(UIColor*)color;



@end
