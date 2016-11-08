//
//  CJPageContentView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJPageContentView.h"

#define ContentCellID @"ContentCellID"



@interface CJPageContentView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *childVcs;
@property (nonatomic, strong) UIViewController *parentViewController;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat startOffsetX;
@property (nonatomic, assign) BOOL isForbidScrollDelegate;


@end



@implementation CJPageContentView



- (UICollectionView *)collectionView
{
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.scrollsToTop = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ContentCellID];
        
    }
    return _collectionView;
}



- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController
{
    
    if (self = [super init])
    {
        self = [[CJPageContentView alloc] initWithFrame:frame];
        
        self.childVcs = childVcs;
        self.parentViewController = parentViewController;
        
        [self setupUI];
    }
    return self;
    
}




/**
 *  设置UI界面
 */
- (void)setupUI
{

#warning isForbidScrollDelegate = NO;
    self.isForbidScrollDelegate = NO;
    
    
    // 1.将所有的子控制器添加到父控制器中
    for (int index = 0; index < self.childVcs.count; index++)
    {
        [self.parentViewController addChildViewController:self.childVcs[index]];
    }
    
    
    // 2.添加UICollectionView,用于在cell中存放控制器的view
    self.collectionView.frame = self.bounds;
    [self addSubview:self.collectionView];
    
    
}





#pragma mark - UICollectionViewDataSource 数据源协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childVcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1.创建cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ContentCellID forIndexPath:indexPath];
    
    
    // 2.给cell设置内容
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    
    UIViewController *childVc = self.childVcs[indexPath.item];
    childVc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVc.view];
    
    
    
    return cell;
    
}



#pragma mark - 遵守 UICollectionViewDelegate 代理


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.isForbidScrollDelegate = NO;
    
    self.startOffsetX = scrollView.contentOffset.x;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 0.判断是否是点击事件
    if (self.isForbidScrollDelegate) { return; }
    
    
    
    
    // 1.定义获取需要的数据
    CGFloat progress = 0;
    NSInteger sourceIndex = 0;
    NSInteger targetIndex = 0;
    
    
    // 2.判断左滑还是右滑
    CGFloat currentOffsexX = scrollView.contentOffset.x;
    CGFloat scrollViewW = scrollView.frame.size.width;
    
    if (currentOffsexX > self.startOffsetX)// 左滑
    {
        // 2.1.计算progress
        progress = currentOffsexX / scrollViewW - floor(currentOffsexX / scrollViewW);
        
        // 2.2计算sourceIndex
        sourceIndex = currentOffsexX / scrollViewW;
        
        // 2.3计算targetIndex
        targetIndex = sourceIndex + 1;
        if (targetIndex >= self.childVcs.count)
        {
            targetIndex = (NSInteger)(self.childVcs.count) - 1;
        }
        
        // 2.4如果完全划过去
        if ((currentOffsexX - self.startOffsetX) == scrollViewW)
        {
            progress = 1;
            targetIndex = sourceIndex;
        }
        
        
        
        
    }
    else// 右滑
    {
        // 2.1.计算progress
        progress = 1 - (currentOffsexX / scrollViewW - floor(currentOffsexX / scrollViewW));
        
        // 2.2计算targetIndex
        targetIndex = currentOffsexX / scrollViewW;
        
        // 2.3计算sourceIndex
        sourceIndex = targetIndex + 1;
        if (sourceIndex >= self.childVcs.count)
        {
            sourceIndex = (NSInteger)(self.childVcs.count) - 1;
        }
        
    }
    
    
    
    // 3.将progress\sourceIndex\targetIndex传递给CJPageTitleView
    // 3.通知代理
    if ([self.delegate respondsToSelector:@selector(pageContentView:progress:sourceIndex:targetIndex:)])
    {
        [self.delegate pageContentView:self progress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
    }
    
    
    
}














#pragma mark - 对外暴露的方法
- (void)setCurrentIndex:(NSInteger)currentIndex
{
    
    // 1.记录需要禁止执行代理方法
    self.isForbidScrollDelegate = YES;
    
    // 2.滚到正确的位置
    CGFloat offsetX = currentIndex * self.collectionView.frame.size.width;
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
    
}








@end











