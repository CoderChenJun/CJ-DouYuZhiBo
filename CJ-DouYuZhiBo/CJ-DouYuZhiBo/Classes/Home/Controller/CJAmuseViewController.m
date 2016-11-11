//
//  CJAmuseViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJAmuseViewController.h"
#import "CJAmuseViewModel.h"
#import "CJAmuseMenuView.h"


#define CJAmuseMenuViewH 200
#define HH 200


@interface CJAmuseViewController ()

@property (nonatomic, strong) CJAmuseViewModel *amuseViewModel;
@property (nonatomic, strong) CJAmuseMenuView *amuseMenuView;


@end




@implementation CJAmuseViewController


- (CJAmuseMenuView *)amuseMenuView
{
    if (_amuseMenuView == nil)
    {
        _amuseMenuView = [CJAmuseMenuView amuseMenuView];
        _amuseMenuView.frame = CGRectMake(0, -CJAmuseMenuViewH, CJUIScreenW, CJAmuseMenuViewH);
//        _amuseMenuView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        _amuseMenuView.backgroundColor = [UIColor purpleColor];
        
    }
    return _amuseMenuView;
}




- (CJAmuseViewModel *)amuseViewModel
{
    if (_amuseViewModel == nil)
    {
        _amuseViewModel = [[CJAmuseViewModel alloc] init];
    }
    return _amuseViewModel;
}




- (void)setupUI
{
    [super setupUI];
    
    [self.collectionView addSubview:self.amuseMenuView];
    self.collectionView.contentInset = UIEdgeInsetsMake(CJAmuseMenuViewH, 0, 0, 0);
    
}





- (void)loadData
{
    // 1.给父类中的baseViewModel赋值
    self.baseViewModel = self.amuseViewModel;
    
    // 2.请求数据
    [self.amuseViewModel loadAmuseDataFinishBlock:^{
        
        [self.collectionView reloadData];
        
        
        NSMutableArray *tempArray = self.amuseViewModel.anchorGroups;
        [tempArray removeObjectAtIndex:0];
        self.amuseMenuView.anchorGroups = tempArray;
        
    }];
    
}


@end









