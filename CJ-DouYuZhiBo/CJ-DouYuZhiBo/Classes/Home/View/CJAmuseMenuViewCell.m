//
//  CJAmuseMenuViewCell.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJAmuseMenuViewCell.h"
#import "CJCollectionGameCell.h"

#define CJCollectionGameCellID @"CJCollectionGameCellID"


@interface CJAmuseMenuViewCell()<UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end






@implementation CJAmuseMenuViewCell


- (void)setAnchorGroups:(NSMutableArray *)anchorGroups
{
    if (_anchorGroups != anchorGroups)
    {
        _anchorGroups = anchorGroups;
        
        [self.collectionView reloadData];
    }
}




- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CJCollectionGameCell" bundle:nil] forCellWithReuseIdentifier:CJCollectionGameCellID];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}




- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置collectionView的layout
    // 1.创建布局
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)(self.collectionView.collectionViewLayout);
    
    CGFloat itemW = self.collectionView.bounds.size.width / 4;
    CGFloat itemH = self.collectionView.bounds.size.height / 2;
    
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
}









#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegate 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return (self.anchorGroups.count) ? (self.anchorGroups.count) : 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CJCollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJCollectionGameCellID forIndexPath:indexPath];
    
    cell.baseGame = self.anchorGroups[indexPath.item];
    
    
    
    // 4.超出部分裁剪(下面横线)
    cell.clipsToBounds = YES;
    
    
    return cell;
    
}









@end





