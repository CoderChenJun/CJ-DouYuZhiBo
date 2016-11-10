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
#define CJCollectionGameViewEdgeInsetsMargin 10


@interface CJRecommendGameView()<UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


//@property (nonatomic, strong) NSMutableArray *tempGroups;

@end









@implementation CJRecommendGameView




//- (void)setGroups:(NSMutableArray *)groups
//{
//    if (_groups != groups)
//    {
//        _groups = groups;
//        
//        self.tempGroups = [NSMutableArray arrayWithArray:groups];
//        
//        [self reloadTempGroups];
//        
////        // 1.移除前两组数据
////        [_groups removeObjectAtIndex:0];
////        [_groups removeObjectAtIndex:0];
////        
////        // 2.添加 "更多" 组
////        CJAnchorGroup *moreAnchorGroup = [[CJAnchorGroup alloc] init];
////        moreAnchorGroup.tag_name = @"更多";
////        [_groups addObject:moreAnchorGroup];
////        
////        // 3.刷新表格
////        [self.collectionView reloadData];
//        
//    }
//}


- (void)setBaseGames:(NSMutableArray *)baseGames
{
    if (_baseGames != baseGames)
    {
        _baseGames = baseGames;
        
//        self.tempGroups = [NSMutableArray arrayWithArray:baseGames];
//        [self reloadTempGroups];
        
        // 3.刷新表格
        [self.collectionView reloadData];
        
        
    }
}







//- (NSMutableArray *)tempGroups
//{
//    if (_tempGroups == nil)
//    {
//        _tempGroups = [NSMutableArray array];
//    }
//    return _tempGroups;
//}
//
//- (void)reloadTempGroups
//{
//    // 1.移除前两组数据
//    [_tempGroups removeObjectAtIndex:0];
//    [_tempGroups removeObjectAtIndex:0];
//
//    // 2.添加 "更多" 组
//    CJAnchorGroup *moreAnchorGroup = [[CJAnchorGroup alloc] init];
//    moreAnchorGroup.tag_name = @"更多";
//    [_tempGroups addObject:moreAnchorGroup];
//
//    // 3.刷新表格
//    [self.collectionView reloadData];
//}












- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 设置该控件 不随 父控件拉伸 而 拉伸
    self.autoresizingMask = UIViewAutoresizingNone;
    
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"CJCollectionGameCell" bundle:nil] forCellWithReuseIdentifier:CJCollectionGameCellID];
    
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
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, CJCollectionGameViewEdgeInsetsMargin, 0, CJCollectionGameViewEdgeInsetsMargin);
    
}





+ (CJRecommendGameView *)recommendGameView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"CJRecommendGameView" owner:nil options:nil] firstObject];
}




#pragma mark - 遵守 UICollectionViewDataSource 协议
#pragma mark - 遵守 UICollectionViewDelegate 协议

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return (self.baseGames.count) ? (self.baseGames.count) : 0;
    
//    return (self.tempGroups.count) ? (self.tempGroups.count) : 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CJCollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CJCollectionGameCellID forIndexPath:indexPath];
    
//    cell.baseGame = self.tempGroups[indexPath.item];
    
    cell.baseGame = self.baseGames[indexPath.item];
    
    return cell;
    
}







@end









