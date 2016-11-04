//
//  CJPageContentView.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>





@class CJPageContentView;
@protocol CJPageContentViewDelegate <NSObject>

@optional
- (void)pageContentView:(CJPageContentView *)pageContentView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;

@end





@interface CJPageContentView : UIView




@property (nonatomic, assign) id<CJPageContentViewDelegate>delegate;




/**
 *  自定义构造函数
 *
 *  @param frame                传入frame
 *  @param childVcs             传入子控制器数组
 *  @param parentViewController 传入父控制器
 *
 *  @return 返回CJPageContentView
 */
- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController;


- (void)setCurrentIndex:(NSInteger)currentIndex;


@end
