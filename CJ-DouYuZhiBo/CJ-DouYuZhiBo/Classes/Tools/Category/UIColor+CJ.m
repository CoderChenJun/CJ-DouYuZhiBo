//
//  UIColor+CJ.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/9.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "UIColor+CJ.h"

@implementation UIColor (CJ)



+ (UIColor *)randomColor
{
    return [UIColor colorWithRed:(arc4random_uniform(255) / 255.0) green:(arc4random_uniform(255) / 255.0) blue:(arc4random_uniform(255) / 255.0) alpha:1.0];
}

@end
