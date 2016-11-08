//
//  CJRecommendViewModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^MyBlock)();





@interface CJRecommendViewModel : NSObject


@property (nonatomic, strong) NSMutableArray *anchorGroups;
- (void)requestDataFinishBlock:(MyBlock)finishCallback;

@end
