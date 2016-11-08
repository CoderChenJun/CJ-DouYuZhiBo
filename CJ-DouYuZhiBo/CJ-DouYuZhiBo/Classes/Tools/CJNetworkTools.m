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






+ (void)requestDataWithMethodType:(MethodType)type URLString:(nonnull NSString *)urlstring parameters:(nullable id)parameters Success:(nullable void (^)(id _Nullable))DIYsuccess failure:(nullable void (^)(NSError  * _Nullable))DIYfailure
{
    
    
    if (type == MethodTypeGET) {
        
        [[AFHTTPSessionManager manager] GET:urlstring parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            DIYsuccess(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            DIYsuccess(error);
            
        }];
        
    }
}



@end

