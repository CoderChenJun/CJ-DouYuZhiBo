//
//  CJCycleModel.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCycleModel.h"

@implementation CJCycleModel


- (void)setRoom:(NSDictionary *)room
{
    if (_room != room)
    {
        _room = room;
        
        self.anchorModel = [CJAnchorModel mj_objectWithKeyValues:room];
    }
}











@end








