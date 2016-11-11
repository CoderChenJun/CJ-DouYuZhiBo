//
//  CJBaseAnchorViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJBaseAnchorViewController.h"
#import "CJRoomNormalViewController.h"
#import "CJRoomShowViewController.h"



@interface CJBaseAnchorViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@end



@implementation CJBaseAnchorViewController


- (UICollectionView *)collectionView
{
    if (_collectionView == nil)
    {
        // 1.创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(CJNormalItemW, CJNormalItemH);
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
    
    // 1.给父类中的内容View的引用进行赋值
    self.contentView = self.collectionView;
    
    // 2.添加collectionView
    [self.view addSubview:self.collectionView];
    
    // 3.调用[super setupUI]
    [super setupUI];
    
    
}


- (void)loadData
{
    
}





#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegateFlowLayout 协议

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
//    if (self.baseViewModel == nil)
//    {
//        return 3;
//    }
    
    
    return self.baseViewModel.anchorGroups.count;
//    return (self.baseViewModel.anchorGroups.count) ? (self.baseViewModel.anchorGroups.count) : 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
//    if (self.baseViewModel == nil)
//    {
//        return 4;
//    }
    
    
    CJAnchorGroup *group = self.baseViewModel.anchorGroups[section];
#warning mark - 如果count为基数,则减1,用双数表示
    return (group.anchorModels.count % 2) ? (group.anchorModels.count - 1) : (group.anchorModels.count);
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 2.定义cell
    CJCollectionNormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJNormalCellID forIndexPath:indexPath];
    
//    if (self.baseViewModel == nil)
//    {
//        return cell;
//    }
    
    
    CJAnchorGroup *group = self.baseViewModel.anchorGroups[indexPath.section];
    cell.anchorModel = group.anchorModels[indexPath.item];
    
    return cell;
    
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CJCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CJHeaderViewID forIndexPath:indexPath];
    
    
//    if (self.baseViewModel == nil)
//    {
//        return headerView;
//    }
    
    // 2.取出模型
    headerView.anchorGroup = self.baseViewModel.anchorGroups[indexPath.section];
    
    return headerView;
    
}








#pragma mark - 遵守 UICollectionViewDelegate 协议
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1.取出对应的主播信息
    CJAnchorGroup *anchorGroup = self.baseViewModel.anchorGroups[indexPath.section];
    CJAnchorModel *anchorModel = anchorGroup.anchorModels[indexPath.item];
    
    
    // 2.判断是  秀场房间  还是  普通房间
    // 判断 ? 普通房间 : 秀场房间
    (anchorModel.isVertical == 0) ? [self pushNormalRoomViewController] : [self presentShowRoomViewController];
    
    
}


/**
 *  push普通房间
 */
- (void)pushNormalRoomViewController
{
    
    // 1.创建CJRoomNormalViewController
    CJRoomNormalViewController *roomNormalVc = [[CJRoomNormalViewController alloc] init];
    
    
    // 2.以Push方式弹出
    [self.navigationController pushViewController:roomNormalVc animated:YES];
}


/**
 *  presentModal秀场房间
 */
- (void)presentShowRoomViewController
{
    
    // 1.创建CJRoomShowViewController
    CJRoomShowViewController *roomShowVc = [[CJRoomShowViewController alloc] init];
    
    
    // 2.以Modal方式弹出
    [self presentViewController:roomShowVc animated:YES completion:nil];
    
}














@end









