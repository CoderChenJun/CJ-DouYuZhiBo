//
//  CJBaseViewModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/10.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)();

@interface CJBaseViewModel : NSObject


@property (nonatomic, strong) NSMutableArray *anchorGroups;


- (void)loadAnchorDataWithURLString:(NSString *)urlString parameters:(id)parameters FinishBlock:(MyBlock)finishCallback;



@end
