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




+ (void)requestDataWithMethodType:(MethodType)type URLString:(nonnull NSString *)urlstring parameters:(nullable id)parameters Success:(nullable void (^)(id _Nullable result))DIYsuccess failure:(nullable void (^)(NSError  * _Nullable error))DIYfailure;




 
 
@end






