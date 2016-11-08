//
//  CJRecommendViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJRecommendViewController.h"
#import "CJCollectionHeaderView.h"
#import "CJCollectionNormalCell.h"
#import "CJCollectionPrettyCell.h"
#import "CJCollectionBaseCell.h"


#import "CJRecommendViewModel.h"// MVVM设计模式---ViewModel
#import "CJAnchorGroup.h"
#import "CJAnchorModel.h"

#define CJItemMargin 10
#define CJItemW ((CJUIScreenW - 3 * CJItemMargin) / 2)
#define CJNormalItemH (CJItemW * 3 / 4)
//#define CJPrettyItemH (CJItemW * 4 / 3)
#define CJPrettyItemH (CJItemW * 8 / 7)
#define CJHeaderViewH 50

#define CJNormalCellID @"CJNormalCellID"
#define CJPrettyCellID @"CJPrettyCellID"

#define CJHeaderViewID @"CJHeaderViewID"


@interface CJRecommendViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) CJRecommendViewModel *recommendViewModel;



@end






@implementation CJRecommendViewController


- (UICollectionView *)collectionView
{
    if (_collectionView == nil)
    {
        // 1.创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(CJItemW, CJNormalItemH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = CJItemMargin;
        layout.headerReferenceSize = CGSizeMake(CJUIScreenW, CJHeaderViewH);
        layout.sectionInset = UIEdgeInsetsMake(0, CJItemMargin, 0, CJItemMargin);
        
        
        
        // 2.创建UICollectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        
        
        [_collectionView registerNib:[UINib nibWithNibName:@"CJCollectionNormalCell" bundle:nil] forCellWithReuseIdentifier:CJNormalCellID];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"CJCollectionPrettyCell" bundle:nil] forCellWithReuseIdentifier:CJPrettyCellID];
        
        
        
        
        [_collectionView registerNib:[UINib nibWithNibName:@"CJCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CJHeaderViewID];
        
        
        
        
        
    }
    return _collectionView;
    
}





- (CJRecommendViewModel *)recommendViewModel
{
    if (_recommendViewModel == nil) {
        _recommendViewModel = [[CJRecommendViewModel alloc] init];
    }
    return _recommendViewModel;
}







- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 1.设置UI界面
    [self setupUI];
    
    // 2.发送网络请求
    [self loadData];
    
    
//    [self example21];
    
    
}



/**
 *  设置UI界面
 */
- (void)setupUI
{
    [self.view addSubview:self.collectionView];
}





//- (void)example21
//{
////    __weak __typeof(self) weakSelf = self;
//    
//    // 下拉刷新
//    self.collectionView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self loadData];
//    }];
//    
//    [self.collectionView.mj_header beginRefreshing];
//}





/**
 *  发送网络请求
 */
- (void)loadData
{
    [self.recommendViewModel requestDataFinishBlock:^{
        
        [self.collectionView reloadData];
        
    }];
    
//    // 让刷新控件停止显示刷新状态
//    [self.collectionView.mj_header endRefreshing];
}

















#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegateFlowLayout 协议

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.recommendViewModel.anchorGroups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
//    if (section == 0)
//    {
//        return 8;
//    }
//    return 4;
    
    
    CJAnchorGroup *group = self.recommendViewModel.anchorGroups[section];
    
    return group.anchorModels.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // 1.取出模型对象
    CJAnchorGroup *anchorGroup = self.recommendViewModel.anchorGroups[indexPath.section];
    
    CJAnchorModel *anchorModel = anchorGroup.anchorModels[indexPath.item];
    
    
    // 2.定义cell
    CJCollectionBaseCell *cell;
    
    
    // 3.取出cell
    if (indexPath.section == 1)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJPrettyCellID forIndexPath:indexPath];
    }
    else
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJNormalCellID forIndexPath:indexPath];
    }
    
    
    // 4.将模型赋值给cell
    cell.anchorModel = anchorModel;
    
    
    
    return cell;
    
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // 1.取出section的HeaderView
//    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CJHeaderViewID forIndexPath:indexPath];
    
    CJCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CJHeaderViewID forIndexPath:indexPath];
    
    
    // 2.取出模型
    headerView.anchorGroup = self.recommendViewModel.anchorGroups[indexPath.section];
    
    
    
    return headerView;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return CGSizeMake(CJItemW, CJPrettyItemH);
    }
    return CGSizeMake(CJItemW, CJNormalItemH);
}











@end










