//
//  CJRecommendCycleView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJRecommendCycleView.h"
#import "CJCycleModel.h"
#import "CJCollectionCycleCell.h"

#define CJRecommendCycleViewCellID @"CJRecommendCycleViewCellID"

/// 定时器时间间隔
#define CJCycleTimeInterval 2.0


@interface CJRecommendCycleView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@property (nonatomic, strong) NSTimer *cycleTimer;



@end








@implementation CJRecommendCycleView





- (void)setCycleModels:(NSMutableArray *)cycleModels
{
    if (_cycleModels != cycleModels)
    {
        _cycleModels = cycleModels;
        
        
        // 1.刷新collectionView表格
        [self.collectionView reloadData];
        
        
        // 2.设置pageControl个数
        self.pageControl.numberOfPages = _cycleModels.count;
        
        
#warning mark - 默认刚开始就滚动到中间
        // 3.默认刚开始就滚动到中间
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:(self.cycleModels.count) * 100 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
        
        // 4.添加定时器
        [self removeCycleTimer];
        [self addCycleTimer];
        
        
    }
}








- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 设置该控件 不随 父控件拉伸 而 拉伸
    self.autoresizingMask = UIViewAutoresizingNone;
    
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"CJCollectionCycleCell" bundle:nil] forCellWithReuseIdentifier:CJRecommendCycleViewCellID];
    
}


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    // 设置collectionView的layout
    // 1.创建布局
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)(self.collectionView.collectionViewLayout);
    
    layout.itemSize = self.collectionView.bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}







+ (CJRecommendCycleView *)recommendCycleView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"CJRecommendCycleView" owner:nil options:nil] firstObject];
}

















#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegate 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
#warning mark - 乘以1000,实现无限轮播
    return (self.cycleModels.count) * 10000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CJCollectionCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJRecommendCycleViewCellID forIndexPath:indexPath];
    
    cell.cycleModel = self.cycleModels[indexPath.row % self.cycleModels.count];
    
    return cell;
}





- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.获取滚动的偏移量
    CGFloat offsexX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5;
    
    // 2.计算pageControl的currentIndex
    self.pageControl.currentPage = (int)(offsexX / scrollView.bounds.size.width) % (self.cycleModels.count);
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeCycleTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addCycleTimer];
}
















#pragma mark - 对定时器的操作方法
- (void)addCycleTimer
{
    // 1.创建定时器
    self.cycleTimer = [NSTimer timerWithTimeInterval:CJCycleTimeInterval target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    
    // 2.添加到运行时中,并循环
    NSRunLoop *looper = [NSRunLoop mainRunLoop] ;
    [looper addTimer:self.cycleTimer forMode:NSRunLoopCommonModes];
    
}

- (void)removeCycleTimer
{
    // 1.从运行循环中移除
    [self.cycleTimer invalidate];
    
    // 2.清空定时器
    self.cycleTimer = nil;
}


- (void)scrollToNext
{
    
    // 1.获取滚动的偏移量
    CGFloat currentOffsetX = self.collectionView.contentOffset.x;
    CGFloat offsetX = currentOffsetX + self.collectionView.bounds.size.width;
    
    // 2.滚动到下一个位置
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}






@end






