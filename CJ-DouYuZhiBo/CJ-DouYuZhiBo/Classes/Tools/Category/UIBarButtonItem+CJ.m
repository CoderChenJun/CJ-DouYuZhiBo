//
//  UIBarButtonItem+CJ.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "UIBarButtonItem+CJ.h"

@implementation UIBarButtonItem (CJ)

// 下面这句pragma是用来  屏蔽  构造方法中会发生的警告
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"


/**
 *  自定义构造方法
 *
 *  @param Image     图片
 *  @param highImage 高亮图片
 *  @param size      尺寸
 *
 *  @return 返回一个UIBarButtonItem
 */
- (instancetype)initWithImage:(NSString *)Image highImage:(NSString *)highImage Size:(CGSize)size
{
    if (self = [super init])
    {
        // 1.创建UIButton
        UIButton *btn = [[UIButton alloc] init];
        
        // 2.设置btn的图片
        [btn setImage:[UIImage imageNamed:Image] forState:UIControlStateNormal];
        if (highImage != nil)
        {
            [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
        }
        
        // 3.设置btn的frame
        if (CGSizeEqualToSize(size, CGSizeZero))
        {
            [btn sizeToFit];
        }
        else
        {
            btn.frame = CGRectMake(0, 0, size.width, size.height);
        }
        
        // 4.创建UIBarButtonItem
        self = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return self;
}








///**
// *  快读创建一个用来显示图片的 item
// *  @param action    监听方法
// */
//+ (UIBarButtonItem *)itemWithImage:(NSString *)Image highImage:(NSString *)highImage target:(id)target action:(SEL)action
//{
//    UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [Button setBackgroundImage:[UIImage imageWithNamed:Image] forState:UIControlStateNormal];
//    [Button setBackgroundImage:[UIImage imageWithNamed:highImage] forState:UIControlStateHighlighted];
//    Button.frame = (CGRect){CGPointZero, Button.currentBackgroundImage.size};
//    [Button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    
//    return [[UIBarButtonItem alloc] initWithCustomView:Button];
//}
//
///**
// *  快速创建一个Item
// *
// *  @param Image     图片
// *  @param highImage 高亮图片
// *  @param size      尺寸
// */
//+ (UIBarButtonItem *)itemWithImage:(NSString *)Image highImage:(NSString *)highImage Size:(CGSize)size
//{
//    UIButton *btn = [[UIButton alloc] init];
//    [btn setImage:[UIImage imageNamed:Image] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
//    
//    btn.frame = CGRectMake(0, 0, size.width, size.height);
//    return [[UIBarButtonItem alloc] initWithCustomView:btn];
//    
//}













@end
