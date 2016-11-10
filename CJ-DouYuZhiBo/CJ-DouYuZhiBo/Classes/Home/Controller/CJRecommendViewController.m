//
//  CJRecommendViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJRecommendViewController.h"


#import "CJRecommendCycleView.h"// 轮播器View
#import "CJRecommendGameView.h"// 游戏推荐View

#import "CJRecommendViewModel.h"// MVVM设计模式---ViewModel



#define CJRecommendCycleViewH (CJUIScreenW * 3 / 8)
#define CJRecommendGameViewH 90


@interface CJRecommendViewController ()<UICollectionViewDelegateFlowLayout>



@property (nonatomic, strong) CJRecommendViewModel *recommendViewModel;


@property (nonatomic, strong) CJRecommendCycleView *recommendCycleView;


@property (nonatomic, strong) CJRecommendGameView *recommendGameView;



@end






@implementation CJRecommendViewController



- (CJRecommendGameView *)recommendGameView
{
    if (_recommendGameView == nil)
    {
        _recommendGameView = [CJRecommendGameView recommendGameView];
        
        _recommendGameView.frame = CGRectMake(0, -CJRecommendGameViewH, CJUIScreenW, CJRecommendGameViewH);
    }
    return _recommendGameView;
}



- (CJRecommendCycleView *)recommendCycleView
{
    if (_recommendCycleView == nil)
    {
        _recommendCycleView = [CJRecommendCycleView recommendCycleView];
        _recommendCycleView.frame =CGRectMake(0, -(CJRecommendCycleViewH + CJRecommendGameViewH), CJUIScreenW, CJRecommendCycleViewH);
    }
    return _recommendCycleView;
}


- (CJRecommendViewModel *)recommendViewModel
{
    if (_recommendViewModel == nil) {
        _recommendViewModel = [[CJRecommendViewModel alloc] init];
    }
    return _recommendViewModel;
}













/**
 *  设置UI界面
 */
- (void)setupUI
{
    // 1.先调用super setupUI
    [super setupUI];
    
    
    // 1.将_collectionView添加到控制器的View中
    [self.view addSubview:self.collectionView];
    
    
    // 2.将_recommendCycleView添加到_collectionView
    [self.collectionView addSubview:self.recommendCycleView];
    
    
    // 3.将_recommendGameView添加到_collectionView
    [self.collectionView addSubview:self.recommendGameView];
    
    
    // 4.设置_collectionView的内边距---为了让_recommendCycleView显示出来
    self.collectionView.contentInset = UIEdgeInsetsMake(CJRecommendCycleViewH + CJRecommendGameViewH, 0, 0, 0);
    
}





//- (void)refreshData
//{
//    __weak __typeof(self) weakSelf = self;
//    
//    // 下拉刷新
//    weakSelf.collectionView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 结束刷新
//            [weakSelf.collectionView.mj_header endRefreshing];
//        });
//    }];
//}





/**
 *  发送网络请求
 */
- (void)loadData
{
    
    // 1.给父类中的baseViewModel赋值
    self.baseViewModel = self.recommendViewModel;
    
    
    // 1.请求---轮播器数据
    [self.recommendViewModel requestCycleDataFinishBlock:^{
        CJLog(@"CJRecommendViewController------轮播器数据请求完成");
        
        self.recommendCycleView.cycleModels = self.recommendViewModel.cycleModels;
        
    }];
    
    
    // 2.请求---推荐数据
    [self.recommendViewModel requestDataFinishBlock:^{
        
        // 2.1.刷新展示 推荐数据
        [self.collectionView reloadData];
        
        
        // 2.2.将数据传递给GameView
        // 2.2.1.移除前两组数据
        NSMutableArray *tempGroups = [NSMutableArray arrayWithArray:self.recommendViewModel.anchorGroups];
        [tempGroups removeObjectAtIndex:0];
        [tempGroups removeObjectAtIndex:0];
        
        // 2.2.2.添加 "更多" 组
        CJAnchorGroup *moreAnchorGroup = [[CJAnchorGroup alloc] init];
        moreAnchorGroup.tag_name = @"更多";
        [tempGroups addObject:moreAnchorGroup];

        // 2.2.3.将数据传递给GameView
        self.recommendGameView.baseGames = tempGroups;
        
    }];
    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1)
    {
        CJAnchorGroup *anchorGroup = self.recommendViewModel.anchorGroups[indexPath.section];
        CJAnchorModel *anchorModel = anchorGroup.anchorModels[indexPath.item];
        
        CJCollectionBaseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJPrettyCellID forIndexPath:indexPath];
        
        cell.anchorModel = anchorModel;
        
        return cell;
    }
    else
    {
        return [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return CGSizeMake(CJNormalItemW, CJPrettyItemH);
    }
    return CGSizeMake(CJNormalItemW, CJNormalItemH);
}





@end










