//
//  CJAnchorGroup.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CJAnchorGroup : NSObject


@property (nonatomic, strong) NSMutableArray *anchorModels;



/// 该组中对应的房间信息
@property (nonatomic, strong) NSArray *room_list;



/// 该组的标题
@property (nonatomic, strong) NSString *tag_name;



/// 组显示的图标
@property (nonatomic, strong) NSString *icon_url;





@property (nonatomic, strong) NSString *icon_name;




@end
