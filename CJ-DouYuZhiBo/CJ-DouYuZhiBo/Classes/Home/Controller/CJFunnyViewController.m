//
//  CJFunnyViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJFunnyViewController.h"
#import "CJFunnyViewModel.h"


#define CJtopInsetMargin 10




@interface CJFunnyViewController ()

@property (nonatomic, strong) CJFunnyViewModel *funnyViewModel;


@end



@implementation CJFunnyViewController


- (CJFunnyViewModel *)funnyViewModel
{
    if (_funnyViewModel == nil)
    {
        _funnyViewModel = [[CJFunnyViewModel alloc] init];
    }
    return  _funnyViewModel;
}





- (void)setupUI
{
    [super setupUI];
    
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.headerReferenceSize = CGSizeZero;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(CJtopInsetMargin, 0, 0, 0);
}

- (void)loadData
{
//    [super loadData];
    
    // 1.给父类中的ViewModel进行赋值
    self.baseViewModel = self.funnyViewModel;
    
    
    // 2.请求数据
    [self.funnyViewModel loadFunnyDataFinishBlock:^{
        [self.collectionView reloadData];
    }];
    
    
    
}





@end







