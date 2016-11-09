//
//  CJCollectionPrettyCell.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCollectionPrettyCell.h"

@implementation CJCollectionPrettyCell

- (void)setAnchorModel:(CJAnchorModel *)anchorModel
{
    
    // 1.将属性传递给父类
    [super setAnchorModel:anchorModel];
    
    
    
    // 3.所在的城市
    [self.cityBtn setTitle:anchorModel.anchor_city forState:UIControlStateNormal];
    
}

@end







