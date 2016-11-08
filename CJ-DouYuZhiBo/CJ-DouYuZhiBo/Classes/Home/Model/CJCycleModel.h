//
//  CJCycleModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "CJAnchorModel.h"


@interface CJCycleModel : NSObject


/// 该组的标题
@property (nonatomic, strong) NSString *title;



/// 组显示的图标
@property (nonatomic, strong) NSString *pic_url;


/// 主播信息对应的字典
@property (nonatomic, strong) NSDictionary *room;


/// 主播信息对应的模型对象
@property (nonatomic, strong) CJAnchorModel *anchorModel;





@end



