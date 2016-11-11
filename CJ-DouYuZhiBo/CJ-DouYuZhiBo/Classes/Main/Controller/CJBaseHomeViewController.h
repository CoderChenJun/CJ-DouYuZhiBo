//
//  CJBaseHomeViewController.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJBaseHomeViewController : UIViewController


@property (nonatomic, strong) UIImageView *animationImageView;

@property (nonatomic, strong) UIView *contentView;



- (void)setupUI;

- (void)loadDateFinished;



@end
