//
//  CJAnchorGroup.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJAnchorGroup.h"

#import "CJAnchorModel.h"

@interface CJAnchorGroup()


@end



@implementation CJAnchorGroup


- (NSMutableArray *)anchorModels
{
    if (_anchorModels == nil)
    {
        _anchorModels = [NSMutableArray array];
    }
    return _anchorModels;
}




- (void)setRoom_list:(NSArray *)room_list
{
    if (_room_list != room_list)
    {
        _room_list = room_list;
        
        for (NSDictionary *dict in room_list)
        {
            CJAnchorModel *anchorModel = [CJAnchorModel mj_objectWithKeyValues:dict];
            
            [self.anchorModels addObject:anchorModel];
            
        }
    }
}




@end









