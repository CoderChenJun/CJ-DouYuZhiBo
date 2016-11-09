//
//  CJGameViewModel.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/9.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJGameViewModel.h"
#import "CJGameModel.h"


@interface CJGameViewModel()

@end



@implementation CJGameViewModel




- (NSMutableArray *)gameModels
{
    if (_gameModels == nil)
    {
        _gameModels = [NSMutableArray array];
    }
    return _gameModels;
}







- (void)loadAllGameDataFinishBlock:(MyBlock)finishCallback
{
    
    [[AFHTTPSessionManager manager] GET:@"http://capi.douyucdn.cn/api/v1/getColumnDetail" parameters:@{@"shortName" : @"game"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        // 1.将result转成字典
        NSDictionary *resultDict = responseObject;
        
        // 2.根据data的Key,获取数组
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        // 3.便利数组,获取字典,并且将字典转成模型对象
        for (NSDictionary *dict in dataArray)
        {
            CJGameModel *gameModel = [CJGameModel mj_objectWithKeyValues:dict];
            [self.gameModels addObject:gameModel];
        }
        
        // 4.完成  回调函数
        finishCallback();
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CJLog(@"CJGameViewModel------111---Error: %@", error);
    }];
    
    
    
    
    
}




@end
