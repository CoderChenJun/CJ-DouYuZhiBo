//
//  CJRecommendViewModel.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJRecommendViewModel.h"

#import "CJAnchorGroup.h"
#import "CJAnchorModel.h"



@interface CJRecommendViewModel()


@property (nonatomic, strong) CJAnchorGroup *bigDataGroup;
@property (nonatomic, strong) CJAnchorGroup *prettyGroup;



@end






@implementation CJRecommendViewModel



- (NSMutableArray *)anchorGroups
{
    if (_anchorGroups == nil)
    {
        _anchorGroups = [NSMutableArray array];
    }
    return _anchorGroups;
}


- (CJAnchorGroup *)prettyGroup
{
    if (_prettyGroup == nil)
    {
        _prettyGroup = [[CJAnchorGroup alloc] init];
    }
    return _prettyGroup;
}

- (CJAnchorGroup *)bigDataGroup
{
    if (_bigDataGroup == nil)
    {
        _bigDataGroup = [[CJAnchorGroup alloc] init];
    }
    return _bigDataGroup;
}




/**
 *  发送网络请求
 */
- (void)requestDataFinishBlock:(MyBlock)finishCallback
{
//    [self.bigDataGroup.anchorModels removeAllObjects];
//    [self.prettyGroup.anchorModels removeAllObjects];
//    [self.anchorGroups removeAllObjects];
    
    
    
    // 1.定义参数
    NSMutableDictionary *parameters =[NSMutableDictionary dictionary];
    [parameters setValue:[NSDate getCurrentTimeFrom1970] forKey:@"time"];
    [parameters setValue:@4 forKey:@"limit"];
    [parameters setValue:@0 forKey:@"offset"];
    
    
    
    // 2.创建Group
    dispatch_group_t dispatchGroup = dispatch_group_create();
    
    
    
    
    
#pragma mark - 3.请求第一部分推荐数据
    // 3.请求第一部分推荐数据
    
    dispatch_group_enter(dispatchGroup);// 发出请求进入组
    
    [[AFHTTPSessionManager manager] GET:@"http://capi.douyucdn.cn/api/v1/getbigDataRoom" parameters:@{@"time" : [NSDate getCurrentTimeFrom1970]} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 1.将result转成字典
        NSDictionary *resultDict = responseObject;
        
        // 2.根据data的Key,获取数组
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        // 3.便利数组,获取字典,并且将字典转成模型对象
        // 3.1.设置组属性
        self.bigDataGroup.tag_name = @"最热";
        self.bigDataGroup.icon_name = @"home_header_hot";
        
        // 3.2.获取主播数据
        for (NSDictionary *dict in dataArray)
        {
            CJAnchorModel *anchorModel = [CJAnchorModel mj_objectWithKeyValues:dict];
            [self.bigDataGroup.anchorModels addObject:anchorModel];
        }
        
        
        // 3.3.获取到数据  离开组
        dispatch_group_leave(dispatchGroup);// 获取到数据  离开组
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CJLog(@"CJRecommendViewModel------第一部分---Error: %@", error);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#pragma mark - 4.请求第二部分颜值数据
    // 4.请求第二部分颜值数据
    
    dispatch_group_enter(dispatchGroup);// 发出请求进入组
    
    [[AFHTTPSessionManager manager] GET:@"http://capi.douyucdn.cn/api/v1/getVerticalRoom" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 1.将result转成字典
        NSDictionary *resultDict = responseObject;
        
        // 2.根据data的Key,获取数组
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        // 3.便利数组,获取字典,并且将字典转成模型对象
        // 3.1.设置组属性
        self.prettyGroup.tag_name = @"颜值";
        self.prettyGroup.icon_name = @"home_header_phone";
        
        // 3.2.获取主播数据
        for (NSDictionary *dict in dataArray)
        {
            CJAnchorModel *anchorModel = [CJAnchorModel mj_objectWithKeyValues:dict];
            [self.prettyGroup.anchorModels addObject:anchorModel];
        }
        
        
        // 3.3.获取到数据  离开组
        dispatch_group_leave(dispatchGroup);// 获取到数据  离开组
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CJLog(@"CJRecommendViewModel------第二部分---Error: %@", error);
    }];
    
    
    
    
    
    
    //    http://capi.douyucdn.cn/api/v1/getbigDataRoom?limit=4&offset=0&time=1478573658
    
    //    http://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&offset=0&time=1478573658
    
    //    http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1478573658
    
    
#pragma mark - 5.请求后2-12部分游戏数据
    // 5.请求后2-12部分游戏数据
    
    dispatch_group_enter(dispatchGroup);// 发出请求进入组
    
    [[AFHTTPSessionManager manager] GET:@"http://capi.douyucdn.cn/api/v1/getHotCate" parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        // 1.将result转成字典
        NSDictionary *resultDict = responseObject;
        
        // 2.根据data的Key,获取数组
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        // 3.便利数组,获取字典,并且将字典转成模型对象
        for (NSDictionary *dict in dataArray)
        {
            CJAnchorGroup *anchorGroup = [CJAnchorGroup mj_objectWithKeyValues:dict];
            [self.anchorGroups addObject:anchorGroup];
            
            
//#warning mark - 把空组移除
//            if (anchorGroup.room_list.count == 0) {
//                [self.anchorGroups removeLastObject];
//            }
            
            
        }
        
        
        
        
        // 4.获取到数据  离开组
        dispatch_group_leave(dispatchGroup);// 获取到数据  离开组
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        CJLog(@"CJRecommendViewModel------第2-12部分---Error: %@", error);
    }];
    
    
    
    
    
    
    
#pragma mark - 所有数据都请求到后,进行排序
    // 6.所有数据都请求到后,进行排序
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
        
        [self.anchorGroups insertObject:self.prettyGroup atIndex:0];
        [self.anchorGroups insertObject:self.bigDataGroup atIndex:0];
        
        finishCallback();
        
    });
    
    
    
    
    
}





@end






