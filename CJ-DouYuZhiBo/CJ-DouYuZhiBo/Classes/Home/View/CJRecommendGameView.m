//
//  CJRecommendGameView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJRecommendGameView.h"
#import "CJCollectionGameCell.h"


#define CJCollectionGameCellID @"CJCollectionGameCellID"

#define CJCollectionGameCellW 80
#define CJCollectionGameCellH 90

@interface CJRecommendGameView()<UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end









@implementation CJRecommendGameView




- (void)setGroups:(NSMutableArray *)groups
{
    if (_groups != groups)
    {
        _groups = groups;
        
        [self.collectionView reloadData];
    }
}








- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 设置该控件 不随 父控件拉伸 而 拉伸
    self.autoresizingMask = UIViewAutoresizingNone;
    
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"CJCollectionGameCell" bundle:nil] forCellWithReuseIdentifier:CJCollectionGameCellID];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CJCollectionGameCellID];
    
}


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    // 设置collectionView的layout
    // 1.创建布局
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)(self.collectionView.collectionViewLayout);
    
    layout.itemSize = CGSizeMake(CJCollectionGameCellW, CJCollectionGameCellH);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
//    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}





+ (CJRecommendGameView *)recommendGameView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"CJRecommendGameView" owner:nil options:nil] firstObject];
}




#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegate 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (self.groups.count) ? (self.groups.count) : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CJCollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJCollectionGameCellID forIndexPath:indexPath];
    
    cell.backgroundColor = (indexPath.item % 2) ? [UIColor redColor] : [UIColor blueColor];
    
//    cell.group = self.groups[indexPath.item];
    
    return cell;
    
}







@end









