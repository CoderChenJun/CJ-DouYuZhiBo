//
//  CJAmuseMenuView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJAmuseMenuView.h"

@implementation CJAmuseMenuView


+ (CJAmuseMenuView *)amuseMenuView
{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"CJAmuseMenuView" owner:nil options:nil] firstObject];
    
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 设置该控件 不随 父控件拉伸 而 拉伸
    self.autoresizingMask = UIViewAutoresizingNone;
    
}



@end
