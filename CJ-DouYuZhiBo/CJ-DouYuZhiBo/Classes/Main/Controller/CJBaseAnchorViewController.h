//
//  CJBaseAnchorViewController.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJBaseViewModel.h"
#import "CJCollectionHeaderView.h"
#import "CJCollectionNormalCell.h"





#define CJItemMargin 10

#define CJHeaderViewH 50

#define CJRecommendCycleViewH (CJUIScreenW * 3 / 8)
#define CJRecommendGameViewH 90

#define CJNormalCellID @"CJNormalCellID"
#define CJHeaderViewID @"CJHeaderViewID"







#define CJPrettyCellID @"CJPrettyCellID"
#define CJNormalItemW ((CJUIScreenW - 3 * CJItemMargin) / 2)
#define CJNormalItemH (CJNormalItemW * 3 / 4)
#define CJPrettyItemH (CJNormalItemW * 7 / 6)


@interface CJBaseAnchorViewController : UIViewController



@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CJBaseViewModel *baseViewModel;


- (void)setupUI;
- (void)loadData;


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end




