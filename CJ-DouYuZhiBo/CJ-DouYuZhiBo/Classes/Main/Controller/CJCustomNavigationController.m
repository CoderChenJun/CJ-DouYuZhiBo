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
    
    
//    // 1.获取系统的Pop手势
//    UIGestureRecognizer *systemGes = self.interactivePopGestureRecognizer;
//    
//    // 2.获取手势添加到的View中
//    UIView *gesView = systemGes.view;
//    
//    
//    
//    
//    // 3.0.利用运行时机制查看所有的属性名称
////    unsigned int count;
////    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
////    for (int i = 0; i < count; i++)
////    {
////        Ivar ivar = *(ivars + i);
////        CJLog(@"CJCustomNavigationController------%s",ivar_getTypeEncoding(ivar));
////        CJLog(@"CJCustomNavigationController------%s",ivar_getName(ivar));
////    }
//    
//    
//    
//    
//    // 3.1.获取target\action
//    NSMutableArray *action_targets = [systemGes valueForKey:@"_targets"];
//    id actionTarget = [action_targets firstObject];
//    
//    // 3.2取出target
//    id target = [actionTarget valueForKey:@"target"];
//    
//    // 3.3取出Action
//    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
//    
//    
//    // 4.创建自己的Pan手势
//    UIGestureRecognizer *panGes = [[UIGestureRecognizer alloc] init];
//    [gesView addGestureRecognizer:panGes];
//    systemGes.enabled = NO;
//    [panGes addTarget:target action:action];
    
    
    
}






- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 1.隐藏push出来控制器的tarBar
    [viewController setHidesBottomBarWhenPushed:YES];
    
    [super pushViewController:viewController animated:YES];
}





@end



