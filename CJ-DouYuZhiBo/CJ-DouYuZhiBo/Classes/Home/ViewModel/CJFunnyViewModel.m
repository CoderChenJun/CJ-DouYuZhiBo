 //
//  CJFunnyViewModel.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJFunnyViewModel.h"

@implementation CJFunnyViewModel





- (void)loadFunnyDataFinishBlock:(MyBlock)finishCallback
{
    
    
    
    [self loadAnchorDataWithURLString:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/3" parameters:@{@"limit" : @30, @"offset" : @0} isGroupData:NO FinishBlock:^{
        finishCallback();
    }];
    
    
    
}



@end








