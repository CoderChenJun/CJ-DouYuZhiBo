//
//  CJAmuseMenuView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJAmuseMenuView.h"
#import "CJAmuseMenuViewCell.h"

#define CJAmuseMenuCellID @"CJAmuseMenuCellID"


@interface CJAmuseMenuView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;




@end




@implementation CJAmuseMenuView


- (void)setAnchorGroups:(NSMutableArray *)anchorGroups
{
    if (_anchorGroups != anchorGroups)
    {
        _anchorGroups = anchorGroups;
        
        [self.collectionView reloadData];
    }
}





+ (CJAmuseMenuView *)amuseMenuView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"CJAmuseMenuView" owner:nil options:nil] firstObject];
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 设置该控件 不随 父控件拉伸 而 拉伸
    self.autoresizingMask = UIViewAutoresizingNone;
    
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CJAmuseMenuViewCell" bundle:nil] forCellWithReuseIdentifier:CJAmuseMenuCellID];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
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
    
//    self.collectionView.contentInset = UIEdgeInsetsMake(0, CJCollectionGameViewEdgeInsetsMargin, 0, CJCollectionGameViewEdgeInsetsMargin);
    
    
}









#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegate 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (self.anchorGroups == nil)
    {
        return 0;
    }
    
    NSInteger pageNum = (self.anchorGroups.count - 1) / 8 + 1;
    
#pragma mark - 设置pageControl.numberOfPages
    self.pageControl.numberOfPages = pageNum;
    
    return pageNum;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CJAmuseMenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJAmuseMenuCellID forIndexPath:indexPath];
    
    [self setupCellDataWithCell:cell AtIndexPath:indexPath];
//    cell.anchorGroups = self.anchorGroups;
    
    return cell;
    
}



- (void)setupCellDataWithCell:(CJAmuseMenuViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath
{
    
    // 0页 : 0 ~ 7
    // 1页 : 8 ~ 15
    // 2页 : 16 ~ 23
    
    
    // 1.取出起始位置 & 终点位置
    CGFloat startIndex = indexPath.item * 8;
    CGFloat endIndex = (indexPath.item + 1) * 8 - 1;
    
    
    // 2.判断越界问题
    if (endIndex > (self.anchorGroups.count - 1))
    {
        endIndex = self.anchorGroups.count - 1;
    }
    
    
    // 3.取出数据,并且赋值给Cell
    cell.anchorGroups = [NSMutableArray array];
    for (int i = startIndex; i < endIndex + 1; i++)
    {
        [cell.anchorGroups addObject:self.anchorGroups[i]];
    }
    
    
//    cell.anchorGroups = [NSMutableArray arrayWithArray:[self.anchorGroups subarrayWithRange:NSMakeRange(startIndex, endIndex + 1)]];
    
    
    
}







- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.获取滚动的偏移量
    CGFloat offsexX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5;
    
    // 2.计算pageControl的currentIndex
    self.pageControl.currentPage = (int)(offsexX / scrollView.bounds.size.width);
    
}






@end










