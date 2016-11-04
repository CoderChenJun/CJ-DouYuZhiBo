//
//  CJPageTitleView.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CJPageTitleView;
@protocol CJPageTitleViewDelegate <NSObject>

@optional
- (void)pageTitleView:(CJPageTitleView *)pageTitleView selectedIndex:(NSInteger)index;

@end






@interface CJPageTitleView : UIView


@property (nonatomic, assign) id<CJPageTitleViewDelegate>delegate;



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





- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;


@end
