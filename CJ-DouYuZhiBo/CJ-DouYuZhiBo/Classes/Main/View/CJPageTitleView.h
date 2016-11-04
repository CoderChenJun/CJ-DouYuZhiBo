//
//  CJPageTitleView.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJPageTitleView : UIView



@property (nonatomic, strong) NSArray *titles;


/**
 *  自定义构造函数
 *
 *  @param frame  传入frame
 *  @param titles 传入titles
 *
 *  @return 返回CJPageTitleView
 */
- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles;



@end
