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


#define CJEdgeMargin 10
#define CJItemW (CJUIScreenW - 2 * CJEdgeMargin) / 3
#define CJItemH CJItemW * 6 / 5


#define CJCollectionGameCellID @"CJCollectionGameCellID"






@interface CJGameViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) CJGameViewModel *gameViewModel;



@end






@implementation CJGameViewController



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
        
        
        // 2.创建_collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _collectionView.dataSource = self;
        
        
        
        // 注册cell
        [_collectionView registerNib:[UINib nibWithNibName:@"CJCollectionGameCell" bundle:nil] forCellWithReuseIdentifier:CJCollectionGameCellID];
        
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
    [self.gameViewModel loadAllGameDataFinishBlock:^{
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
    
    // 3.取出cell
    CJCollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJCollectionGameCellID forIndexPath:indexPath];
    
    
    // 4.将模型赋值给cell
    
    
    
    cell.baseGame = self.gameViewModel.gameModels[indexPath.item];
    
    
    cell.backgroundColor = [UIColor randomColor];
    
    
    
    return cell;
    
}






@end









