//
//  CJBaseAnchorViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJBaseAnchorViewController.h"
#import "CJCollectionHeaderView.h"
#import "CJCollectionNormalCell.h"


#define CJItemMargin 10
#define CJItemW ((CJUIScreenW - 3 * CJItemMargin) / 2)
#define CJNormalItemH (CJItemW * 3 / 4)
//#define CJPrettyItemH (CJItemW * 4 / 3)
#define CJPrettyItemH (CJItemW * 7 / 6)
#define CJHeaderViewH 50


#define CJRecommendCycleViewH (CJUIScreenW * 3 / 8)
#define CJRecommendGameViewH 90



#define CJNormalCellID @"CJNormalCellID"
#define CJPrettyCellID @"CJPrettyCellID"

#define CJHeaderViewID @"CJHeaderViewID"







@interface CJBaseAnchorViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>




@end








@implementation CJBaseAnchorViewController





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






- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 1.设置UI界面
    [self setupUI];
    
    
    // 2.发送网络请求
    [self loadData];
    
}




/**
 *  设置UI界面
 */
- (void)setupUI
{
    [self.view addSubview:self.collectionView];
    
}


- (void)loadData
{
    
}

















#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegateFlowLayout 协议

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.baseViewModel.anchorGroups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    CJAnchorGroup *group = self.baseViewModel.anchorGroups[section];
    return group.anchorModels.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 2.定义cell
    CJCollectionNormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJNormalCellID forIndexPath:indexPath];
    
    
    CJAnchorGroup *group = self.baseViewModel.anchorGroups[indexPath.section];
    cell.anchorModel = group.anchorModels[indexPath.item];
//    cell.backgroundColor = [UIColor randomColor];
    
    return cell;
    
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CJCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CJHeaderViewID forIndexPath:indexPath];
    
    // 2.取出模型
    headerView.anchorGroup = self.baseViewModel.anchorGroups[indexPath.section];
    
    return headerView;
    
}






@end









