//
//  CJCollectionHeaderView.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCollectionHeaderView.h"

@implementation CJCollectionHeaderView


- (void)setAnchorGroup:(CJAnchorGroup *)anchorGroup
{
    if (_anchorGroup != anchorGroup)
    {
        _anchorGroup = anchorGroup;
        
        if (anchorGroup.tag_name)
        {
            self.titleLabel.text = anchorGroup.tag_name;
        }
        else
        {
            self.titleLabel.text = @"最热";
        }
        
        if (anchorGroup.icon_name)
        {
            self.iconImageView.image = [UIImage imageNamed:anchorGroup.icon_name];
        }
        else
        {
            self.iconImageView.image = [UIImage imageNamed:@"home_header_normal"];
        }
    }
}



+ (CJCollectionHeaderView *)collectionHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"CJCollectionHeaderView" owner:nil options:nil] firstObject];
}





@end





