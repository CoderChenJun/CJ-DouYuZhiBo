//
//  CJGameViewModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/9.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)();


@interface CJGameViewModel : NSObject


@property (nonatomic, strong) NSMutableArray *gameModels;

- (void)loadAllGameDataFinishBlock:(MyBlock)finishCallback;


@end
