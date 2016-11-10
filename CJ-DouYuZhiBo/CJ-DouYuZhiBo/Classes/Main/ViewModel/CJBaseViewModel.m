//
//  CJBaseViewModel.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJBaseViewModel.h"
#import "CJAnchorGroup.h"

@interface CJBaseViewModel()


@end



@implementation CJBaseViewModel




- (NSMutableArray *)anchorGroups
{
    if (_anchorGroups == nil)
    {
        _anchorGroups = [NSMutableArray array];
    }
    return _anchorGroups;
}





- (void)loadAnchorDataWithURLString:(NSString *)urlString parameters:(id)parameters FinishBlock:(MyBlock)finishCallback
{
    
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 1.将result转成字典
        NSDictionary *resultDict = responseObject;
        // 2.根据data的Key,获取数组
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        
        // 3.便利数组,获取字典,并且将字典转成模型对象
        for (NSDictionary *dict in dataArray)
        {
            CJAnchorGroup *anchorGroup = [CJAnchorGroup mj_objectWithKeyValues:dict];
            [self.anchorGroups addObject:anchorGroup];
            
            if (anchorGroup.room_list.count == 0)
            {
                [self.anchorGroups removeLastObject];
            }
            
        }
        
        // 4.完成  回调函数
        finishCallback();
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CJLog(@"CJBaseViewModel------111---Error: %@", error);
    }];

    
    
}











@end





