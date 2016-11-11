//
//  CJRoomNormalViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJRoomNormalViewController.h"

@interface CJRoomNormalViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CJRoomNormalViewController

- (void)viewDidLoad


{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
    // 2.依然保持手势
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self.navigationController.interactivePopGestureRecognizer setEnabled:YES];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 1.显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}




@end






