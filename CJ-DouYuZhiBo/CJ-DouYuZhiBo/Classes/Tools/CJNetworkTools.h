//
//  CJNetworkTools.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^MyBlock)();

//推荐的定义枚举类型的方式
typedef NS_ENUM(NSInteger, MethodType) {
    MethodTypeGET,
    MethodTypePOST
};




@interface CJNetworkTools : NSObject





/*
+ (void)requestDataWithMethodType:(MethodType)type URLString:(NSString *)urlstring parameters:(NSDictionary *)parameters Success:(MyBlock)successBlock Error:(MyBlock)errorBlock;
*/




+ (void)requestDataWithMethodType:(MethodType)type
                        URLString:(nullable NSString *)urlstring parameters:(nullable id)parameters
                          Success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;


 
 
@end






