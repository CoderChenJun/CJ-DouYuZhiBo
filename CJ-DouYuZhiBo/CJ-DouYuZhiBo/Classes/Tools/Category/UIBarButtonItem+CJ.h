//
//  UIBarButtonItem+CJ.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CJ)



///**
// *  快读创建一个用来显示图片的 item
// *  @param action    监听方法
// */
//+ (UIBarButtonItem *)itemWithImage:(NSString *)Image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
//
///**
// *  快速创建一个Item
// *
// *  @param Image     图片
// *  @param highImage 高亮图片
// *  @param size      尺寸
// */
//+ (UIBarButtonItem *)itemWithImage:(NSString *)Image highImage:(NSString *)highImage Size:(CGSize)size;







/**
 *  自定义构造方法
 *
 *  @param Image     图片
 *  @param highImage 高亮图片
 *  @param size      尺寸
 *
 *  @return 返回一个UIBarButtonItem
 */
- (instancetype)initWithImage:(NSString *)Image highImage:(NSString *)highImage Size:(CGSize)size;












@end
