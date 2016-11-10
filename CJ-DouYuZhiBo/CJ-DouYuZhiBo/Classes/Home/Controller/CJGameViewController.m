//
//  CJGameViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/9.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJGameViewController.h"
#import "CJGameViewModel.h"
#import "CJGameModel.h"
#import "CJCollectionGameCell.h"
#import "CJCollectionHeaderView.h"
#import "CJRecommendGameView.h"



#define CJEdgeMargin 10
#define CJItemW (CJUIScreenW - 2 * CJEdgeMargin) / 3
#define CJItemH CJItemW * 6 / 5

#define CJHeaderViewH 50
#define CJGameViewH 90


#define CJCollectionGameViewCellID @"CJCollectionGameViewCellID"
#define CJCollectionGameViewHeaderID @"CJCollectionGameViewHeaderID"






@interface CJGameViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) CJGameViewModel *gameViewModel;


@property (nonatomic, strong) CJCollectionHeaderView *topHeaderView;

@property (nonatomic, strong) CJRecommendGameView *gameView;




@end






@implementation CJGameViewController



- (CJRecommendGameView *)gameView
{
    if (_gameView == nil)
    {
        _gameView = [CJRecommendGameView recommendGameView];
        _gameView.frame = CGRectMake(0, -CJGameViewH, CJUIScreenW, CJGameViewH);
    }
    return _gameView;
}



- (CJCollectionHeaderView *)topHeaderView
{
    if (_topHeaderView == nil)
    {
        _topHeaderView = [CJCollectionHeaderView collectionHeaderView];
        
        _topHeaderView.frame = CGRectMake(0, -(CJHeaderViewH + CJGameViewH), CJUIScreenW, CJHeaderViewH);
        
        _topHeaderView.iconImageView.image = [UIImage imageNamed:@"Img_orange"];
        
        _topHeaderView.titleLabel.text = @"常用";
        
        _topHeaderView.moreBtn.hidden = YES;
        
    }
    return _topHeaderView;
}








- (CJGameViewModel *)gameViewModel
{
    if (_gameViewModel == nil)
    {
        _gameViewModel = [[CJGameViewModel alloc] init];
    }
    return _gameViewModel;
    
}







- (UICollectionView *)collectionView
{
    if (_collectionView == nil)
    {
        
        // 1.创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(CJItemW, CJItemH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, CJEdgeMargin, 0, CJEdgeMargin);
        layout.headerReferenceSize = CGSizeMake(CJUIScreenW, CJHeaderViewH);
        
        
        
        // 2.创建_collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _collectionView.dataSource = self;
        
        
        
        // 注册cell
        [_collectionView registerNib:[UINib nibWithNibName:@"CJCollectionGameCell" bundle:nil] forCellWithReuseIdentifier:CJCollectionGameViewCellID];
        // 注册Header
        [_collectionView registerNib:[UINib nibWithNibName:@"CJCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CJCollectionGameViewHeaderID];
        
        
        
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
    // 1.添加UICollectionView
    [self.view addSubview:self.collectionView];
    
    
    // 2.将顶部的HeaderView添加到UICollectionView
    [self.collectionView addSubview:self.topHeaderView];
    
    // 3.将常用游戏View添加到UICollectionView
    [self.collectionView addSubview:self.gameView];
    
    
    // 3.设置_collectionView的内边距---为了让_topHeaderView显示出来
    self.collectionView.contentInset = UIEdgeInsetsMake(CJHeaderViewH + CJGameViewH, 0, 0, 0);
    
    
}



- (void)loadData
{
    
    [self.gameViewModel loadAllGameDataFinishBlock:^{
        
        
        // 1.展示常用游戏
        self.gameView.baseGames = [NSMutableArray arrayWithArray:[self.gameViewModel.gameModels subarrayWithRange:NSMakeRange(0, 10)]];
        
        
        
        
        // 2.展示全部游戏
        [self.collectionView reloadData];
        
        
    }];
    
}









#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegate 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.gameViewModel.gameModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1.取出cell
    CJCollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJCollectionGameViewCellID forIndexPath:indexPath];
    
    
    // 2.将模型赋值给cell
    cell.baseGame = self.gameViewModel.gameModels[indexPath.item];
    
    
//    cell.backgroundColor = [UIColor randomColor];
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    CJCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CJCollectionGameViewHeaderID forIndexPath:indexPath];
    
    
//    // 2.取出模型
//    headerView.anchorGroup = self.recommendViewModel.anchorGroups[indexPath.section];
    
    headerView.titleLabel.text = @"全部";
    headerView.iconImageView.image = [UIImage imageNamed:@"Img_orange"];
    headerView.moreBtn.hidden = YES;
    
    
    
    return headerView;
}








@end









