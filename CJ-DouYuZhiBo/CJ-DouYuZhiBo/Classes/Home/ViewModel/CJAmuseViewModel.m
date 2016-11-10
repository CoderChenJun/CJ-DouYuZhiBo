//
//  CJAmuseViewModel.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJAmuseViewModel.h"
#import "CJAnchorGroup.h"

@interface CJAmuseViewModel()

@end



@implementation CJAmuseViewModel


- (void)loadAmuseDataFinishBlock:(MyBlock)finishCallback
{
    
#pragma mark - 抽取到父类 - CJBaseViewModel - 中
    [self loadAnchorDataWithURLString:@"http://capi.douyucdn.cn/api/v1/getHotRoom/2" parameters:nil FinishBlock:^{
        finishCallback();
    }];
    
    
}


@end
