//
//  CJPageTitleView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJPageTitleView.h"


#define CJscrollLineH 2





@interface CJPageTitleView()


@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *scrollLine;

@property (nonatomic, strong) NSMutableArray *titleLabels;



@end







@implementation CJPageTitleView



- (UIScrollView *)scrollView
{
    if (_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}


- (UIView *)scrollLine
{
    if (_scrollLine == nil)
    {
        _scrollLine = [[UIView alloc] init];
        _scrollLine.backgroundColor = [UIColor orangeColor];
    }
    return _scrollLine;
}

- (NSMutableArray *)titleLabels
{
    if (_titleLabels == nil)
    {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}









- (void)setTitles:(NSArray *)titles
{
    if (_titles != titles)
    {
        _titles = titles;
        [self setupUI];
    }
    
}


- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles
{
    if (self = [super init])
    {
        self = [[CJPageTitleView alloc] initWithFrame:frame];
        
        self.titles = titles;
        
        CJLog(@"%p",self.titles);
        CJLog(@"%@",self.titles);
        CJLog(@"%lu",(unsigned long)self.titles.count);
        
//        [self setupUI];
    }
    return self;
}





/**
 *  设置UI界面
 */
- (void)setupUI
{
    
    // 1.添加UIScrollView
    self.scrollView.frame = self.bounds;
    [self addSubview:self.scrollView];
    
    
    // 2.添加title对应的label
    [self setupTitleLabels];
    
    
    
    // 3.设置底线和滚动的滑块
    [self setupBottomLineAndScrollLine];
    
    
}





/**
 *  添加title对应的label
 */
- (void)setupTitleLabels
{
    // 0.确定label的一些固定的frame值
    CGFloat labelW = self.frame.size.width / self.titles.count;
    CGFloat labelH = self.frame.size.height - CJscrollLineH;
    CGFloat labelY = 0;
    
    for (int index = 0; index < self.titles.count; index++)
    {
        // 1.创建UILabel
        UILabel *label = [[UILabel alloc] init];
        
        // 2.设置label的属性
        label.text = self.titles[index];
        label.tag = index;
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = [UIColor darkGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        // 3.设置label的frame
        CGFloat labelX = index * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        // 4.将label添加到scrollView中
        [self.scrollView addSubview:label];
        
        [self.titleLabels addObject:label];
        
        
    }
    
    
}






/**
 *  设置底线和滚动的滑块
 */
- (void)setupBottomLineAndScrollLine
{
    // 1.添加底线
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    CGFloat lineH = 0.5;
    bottomLine.frame = CGRectMake(0, self.frame.size.height - lineH, self.frame.size.width, lineH);
    [self addSubview:bottomLine];
    
    
    
    
    // 2.添加scrollLine
    
    // 2.1获取第一个label
    UILabel *firstLabel = self.titleLabels.firstObject;
    firstLabel.textColor = [UIColor orangeColor];
    
    // 2.2设置scrollLine的属性
    self.scrollLine.frame = CGRectMake(firstLabel.frame.origin.x, self.frame.size.height - CJscrollLineH, firstLabel.frame.size.width, CJscrollLineH);
    [self.scrollView addSubview:self.scrollLine];
    
    
    
    
}




@end





