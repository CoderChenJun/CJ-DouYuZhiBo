//
//  CJBaseHomeViewController.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJBaseHomeViewController.h"


@interface CJBaseHomeViewController ()


@end




@implementation CJBaseHomeViewController


- (UIImageView *)animationImageView
{
    if (_animationImageView == nil)
    {
        _animationImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_loading_1"]];
        _animationImageView.center = self.view.center;
        
        _animationImageView.animationImages = @[[UIImage imageNamed:@"img_loading_1"], [UIImage imageNamed:@"img_loading_2"]];
        _animationImageView.animationDuration = 0.5;
        _animationImageView.animationRepeatCount = LONG_MAX;
        
        _animationImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        
    }
    return _animationImageView;
}



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI
{
    
    // 1.先隐藏内容View
    self.contentView.hidden = YES;
    
    
    // 2.添加执行动画的animationImageView
    [self.view addSubview:self.animationImageView];
    
    
    // 3.给animationImageView执行动画
    [self.animationImageView startAnimating];
    
    
    // 4.设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
}




- (void)loadDateFinished
{
    
    // 1.停止动画
    [self.animationImageView stopAnimating];
    
    // 2.隐藏animationImageView
    self.animationImageView.hidden = YES;
    
    // 3.显示内容View
    self.contentView.hidden = NO;
    
    
}






@end









