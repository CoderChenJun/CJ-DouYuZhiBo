//
//  CJHomeViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJHomeViewController.h"

#import "CJPageTitleView.h"
#import "CJPageContentView.h"

#import "CJRecommendViewController.h"
#import "CJGameViewController.h"

#define CJPageTitleViewH 40




@interface CJHomeViewController()<CJPageTitleViewDelegate,CJPageContentViewDelegate>

@property (nonatomic, strong) CJPageTitleView *pageTitleView;

@property (nonatomic, strong) CJPageContentView *pageContentView;


@end




@implementation CJHomeViewController


- (CJPageTitleView *)pageTitleView
{
    if (_pageTitleView == nil)
    {
        
        CGRect titleFrame = CGRectMake(0, CJStatusBarH + CJNavigationBarH, CJUIScreenW, CJPageTitleViewH);
        NSArray *titles = @[@"推荐", @"游戏", @"娱乐", @"趣玩"];
        
        _pageTitleView = [[CJPageTitleView alloc] initWithFrame:titleFrame Titles:titles];
        
//        _pageTitleView = [[CJPageTitleView alloc] initWithFrame:titleFrame];
//        _pageTitleView.titles = titles;
        
        _pageTitleView.delegate = self;
        
        
    }
    return _pageTitleView;
}


- (CJPageContentView *)pageContentView
{
    if (_pageContentView == nil)
    {
        
        // 1.确定内容的frame
        CGFloat contentH = CJUIScreenH - CJStatusBarH - CJNavigationBarH - CJPageTitleViewH - CJtabBarH;
        CGRect contentFrame = CGRectMake(0, CJStatusBarH + CJNavigationBarH + CJPageTitleViewH, CJUIScreenW, contentH);
        
        
        
        // 2.确定所有的子控制器
        NSMutableArray *childVcs =[NSMutableArray array];
        
        CJRecommendViewController *recommendVc = [[CJRecommendViewController alloc] init];
        [childVcs addObject:recommendVc];
        
        CJGameViewController *gameVc = [[CJGameViewController alloc] init];
        [childVcs addObject:gameVc];
        
        for (int index = 0; index < 2; index++)
        {
            UIViewController *vc =[[UIViewController alloc] init];
            vc.view.backgroundColor = CJColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
            [childVcs addObject:vc];
        }
        
        
        
        
        // 3.创建CJPageContentView
        _pageContentView = [[CJPageContentView alloc] initWithFrame:contentFrame childVcs:childVcs parentViewController:self];
        
        _pageContentView.delegate = self;
        
    }
    return _pageContentView;
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
}



/**
 *  设置UI界面
 */
- (void)setupUI
{
    // 0.不需要调整UIScrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    // 1.设置导航栏
    [self setupNavigationBar];
    
    
    
    // 2.添加CJPageTitleView
    [self.view addSubview:self.pageTitleView];
    
    
    
    // 3.添加CJPageContentView
    [self.view addSubview:self.pageContentView];
    
    
}



/**
 *  设置导航栏
 */
- (void)setupNavigationBar
{
    // 1.设置左侧Item
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:@"logo" highImage:nil Size:CGSizeZero];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 2.设置右侧Item
    CGSize size = CGSizeMake(40, 40);
    UIBarButtonItem *historyItem = [[UIBarButtonItem alloc] initWithImage:@"image_my_history" highImage:@"Image_my_history_click" Size:size];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:@"btn_search" highImage:@"btn_search_click" Size:size];
    UIBarButtonItem *qrcodeItem = [[UIBarButtonItem alloc] initWithImage:@"Image_qrcode" highImage:@"Image_qrcode_click" Size:size];
    self.navigationItem.rightBarButtonItems = @[searchItem, qrcodeItem, historyItem];
    
    
    
}










#pragma mark - 遵守 CJPageTitleViewDelegate 协议
- (void)pageTitleView:(CJPageTitleView *)pageTitleView selectedIndex:(NSInteger)index
{
    [self.pageContentView setCurrentIndex:index];
}



#pragma mark - 遵守 CJPageContentViewDelegate 协议
- (void)pageContentView:(CJPageContentView *)pageContentView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex
{
    [self.pageTitleView setTitleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}






@end




