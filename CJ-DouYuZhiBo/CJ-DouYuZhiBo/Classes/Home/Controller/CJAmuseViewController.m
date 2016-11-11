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
        
        // 2.1.刷新表格
        [self.collectionView reloadData];
        
        // 2.2.调整数据
        NSMutableArray *tempArray = self.amuseViewModel.anchorGroups;
        [tempArray removeObjectAtIndex:0];
        self.amuseMenuView.anchorGroups = tempArray;
        
        
        
        
#warning mark - 数据请求完成,隐藏动画
        // 3.数据请求完成
        [self loadDateFinished];
        
    }];
    
}


@end









