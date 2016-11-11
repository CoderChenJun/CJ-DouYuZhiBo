//
//  CJCustomNavigationController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCustomNavigationController.h"

@interface CJCustomNavigationController ()

@end

@implementation CJCustomNavigationController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 1.隐藏push出来控制器的tarBar
    [viewController setHidesBottomBarWhenPushed:YES];
    
    
    
    [super pushViewController:viewController animated:YES];
    
}


@end



