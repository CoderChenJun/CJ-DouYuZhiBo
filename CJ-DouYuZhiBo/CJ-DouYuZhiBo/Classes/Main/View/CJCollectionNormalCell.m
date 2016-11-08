//
//  CJCollectionNormalCell.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCollectionNormalCell.h"

@implementation CJCollectionNormalCell



- (void)setAnchorModel:(CJAnchorModel *)anchorModel
{
    // 1.将属性传递给父类
    [super setAnchorModel:anchorModel];
    
    // 2.房间名称(特有属性)
    self.roomNameLabel.text = anchorModel.room_name;
}





@end
