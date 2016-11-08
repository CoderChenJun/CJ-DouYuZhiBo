//
//  CJMainViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/4.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJMainViewController.h"

@implementation CJMainViewController


- (void)viewDidLoad
{
    
    [self addChildVcWithStoryBoardName:@"Home"];
    [self addChildVcWithStoryBoardName:@"Live"];
    [self addChildVcWithStoryBoardName:@"Follow"];
    [self addChildVcWithStoryBoardName:@"Profile"];
    
    
    
    
    
}



- (void)addChildVcWithStoryBoardName:(NSString *)storyboardName
{
    // 1.通过storyboard获得控制器
    UIViewController *childVc = [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateInitialViewController];
    
    // 2.将childVc作为子控制器
    [self addChildViewController:childVc];
}







@end
