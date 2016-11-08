//
//  UIImage+CJ.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "UIImage+CJ.h"

@implementation UIImage (CJ)



+ (UIImage *)imageWithNamed:(NSString *)name
{
    if (iOS7)
    {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil)// 没有_os7后缀的图片
        {
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    
    // 非 iOS7
    return [UIImage imageNamed:name];
}



/**
 *  返回一张通过最中心点进行拉伸的图片
 *
 *  @param name 原始图片
 *
 *  @return 拉伸结果图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    //    // 导入原来图片
    //    UIImage *normal = [UIImage imageNamed:name];
    //    // 四边不需要拉伸的边距
    //    CGFloat normalW = normal.size.width * 0.5;
    //    CGFloat normalH = normal.size.height * 0.5;
    //    // 设置图片拉伸的最终图片
    //    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(normalH, normalW, normalH, normalW)];
    
    
    return [self resizedImageWithName:name left:0.5 top:0.5];
}




/**
 *  传入百分比,返回一张自由拉伸的图片
 *
 *  @param name 原始图片
 *  @param left 左边 百分之多少 需要保护
 *  @param top  上边 百分之多少 需要保护
 *
 *  @return 拉伸结果图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    // 导入原来图片
    UIImage *normal = [UIImage imageNamed:name];
    // 返回
    return [normal stretchableImageWithLeftCapWidth:normal.size.width * left topCapHeight:normal.size.height * top];
}













/**
 *  通过传递颜色 color 生成纯色图片
 */
+(UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}






@end
