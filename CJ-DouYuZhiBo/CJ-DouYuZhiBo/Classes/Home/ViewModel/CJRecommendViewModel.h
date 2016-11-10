//
//  CJRecommendViewModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJBaseViewModel.h"

typedef void(^MyBlock)();


@interface CJRecommendViewModel : CJBaseViewModel



/**
 *  请求---(推荐内容数据)
 */
- (void)requestDataFinishBlock:(MyBlock)finishCallback;




@property (nonatomic, strong) NSMutableArray *cycleModels;
/**
 *  请求---(无限轮播数据)
 */
- (void)requestCycleDataFinishBlock:(MyBlock)finishCallback;

@end
