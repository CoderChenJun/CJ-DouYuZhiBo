//
//  CJNetworkTools.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJNetworkTools.h"
#import "AFNetworking.h"





@implementation CJNetworkTools
/*
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure

*/




+ (void)requestDataWithMethodType:(MethodType)type
                        URLString:(nullable NSString *)urlstring parameters:(nullable id)parameters
                          Success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure
{
    
}



@end

