//
//  CJFunnyViewModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/11.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJBaseViewModel.h"


typedef void(^MyBlock)();



@interface CJFunnyViewModel : CJBaseViewModel


- (void)loadFunnyDataFinishBlock:(MyBlock)finishCallback;


@end


