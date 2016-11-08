//
//  CJPageTitleView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJPageTitleView.h"


#define CJscrollLineH 2

#define CJNormalColor0 85
#define CJNormalColor1 85
#define CJNormalColor2 85

#define CJSelectColor0 255
#define CJSelectColor1 128
#define CJSelectColor2 0




@interface CJPageTitleView()


@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *scrollLine;

@property (nonatomic, strong) NSMutableArray *titleLabels;


@property (nonatomic, assign) NSInteger currentIndex;



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
        
//        [self setupUI];
    }
    return self;
}





/**
 *  设置UI界面
 */
- (void)setupUI
{
    
//    self.currentIndex = 0;
    
    
    
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
        label.textColor = CJColor(CJNormalColor0, CJNormalColor1, CJNormalColor2);
        label.textAlignment = NSTextAlignmentCenter;
        
        // 3.设置label的frame
        CGFloat labelX = index * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        // 4.将label添加到scrollView中
        [self.scrollView addSubview:label];
        
        [self.titleLabels addObject:label];
        
        
        
        
        
        // 5.给label添加手势
        [label setUserInteractionEnabled:YES];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)];
        [label addGestureRecognizer:tapGes];
        
        
        
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
    firstLabel.textColor = CJColor(CJSelectColor0, CJSelectColor1, CJSelectColor2);
    
    // 2.2设置scrollLine的属性
    self.scrollLine.frame = CGRectMake(firstLabel.frame.origin.x, self.frame.size.height - CJscrollLineH, firstLabel.frame.size.width, CJscrollLineH);
    [self.scrollView addSubview:self.scrollLine];
    
    
}



- (void)titleLabelClick:(UITapGestureRecognizer *)tapGes
{
    
    
    
    // 1.获取当前label
    UILabel *currentLabel = (UILabel *)(tapGes.view);
    
    // 2.如果是重复点击同一个title,那么直接返回
    if (currentLabel.tag == self.currentIndex) { return; }
    
    
    // 3.获取之前的label
    UILabel *oldLabel = self.titleLabels[self.currentIndex];
    
    
    // 4.切换文字的颜色
    currentLabel.textColor = CJColor(CJSelectColor0, CJSelectColor1, CJSelectColor2);
    oldLabel.textColor = CJColor(CJNormalColor0, CJNormalColor1, CJNormalColor2);

    
    
    // 5.保存最新label的下标值
    self.currentIndex =currentLabel.tag;
    
    
    // 6.滚动条位置发生改变
    CGFloat scrollLineX = currentLabel.tag * self.scrollLine.frame.size.width;
    
    [UIView animateWithDuration:0.15 animations:^{
        
        CGRect scrollLineFrame = self.scrollLine.frame;
        scrollLineFrame.origin.x = scrollLineX;
        self.scrollLine.frame = scrollLineFrame;
        
    }];
    
    
    
    
    
    // 7.传递数据给上一个控制器(CJHomeViewController)
    // 7.通知代理
    if ([self.delegate respondsToSelector:@selector(pageTitleView:selectedIndex:)])
    {
        [self.delegate pageTitleView:self selectedIndex:self.currentIndex];
    }
    
    
    
}






#pragma mark - 对外暴露的方法
- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex
{
    
    // 1.取出sourceLabel\targetLabel
    UILabel *sourceLabel = self.titleLabels[sourceIndex];
    UILabel *targetLabel = self.titleLabels[targetIndex];
    
    
    // 2.处理滑块的逻辑
    CGFloat moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x;
    CGFloat moveX = moveTotalX * progress;
    
//    self.scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX;
    CGRect scrollLineFrame = self.scrollLine.frame;
    scrollLineFrame.origin.x = sourceLabel.frame.origin.x + moveX;
    self.scrollLine.frame = scrollLineFrame;
    
    
    
    
    // 3.颜色的渐变(复杂)
    // 3.1.取出变化的范围
    CGFloat colorDelta0 = CJSelectColor0 - CJNormalColor0;
    CGFloat colorDelta1 = CJSelectColor1 - CJNormalColor1;
    CGFloat colorDelta2 = CJSelectColor2 - CJNormalColor2;
    
    // 3.2.变化sourceLabel颜色
    sourceLabel.textColor = CJColor(CJSelectColor0 - colorDelta0 * progress, CJSelectColor1 - colorDelta1 * progress, CJSelectColor2 - colorDelta2 * progress);
    
    // 3.3.变化targetLabel颜色
    targetLabel.textColor = CJColor(CJNormalColor0 + colorDelta0 * progress, CJNormalColor1 + colorDelta1 * progress, CJNormalColor2 + colorDelta2 * progress);
    
    
    // 4.记录最新的currentIndex
    self.currentIndex = targetIndex;
    
}





@end





