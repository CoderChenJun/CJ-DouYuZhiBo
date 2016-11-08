//
//  CJAnchorModel.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJAnchorModel : NSObject


/// 房间ID
@property (nonatomic, assign) int room_id;


/// 房间图片对应的URLString
@property (nonatomic, strong) NSString *vertical_src;


/// 判断是手机直播还是电脑直播
// 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
@property (nonatomic, assign) int isVertical;


/// 房间名称
@property (nonatomic, strong) NSString *room_name;


/// 主播昵称
@property (nonatomic, strong) NSString *nickname;


/// 观看人数
@property (nonatomic, assign) int online;


/// 所在城市
@property (nonatomic, strong) NSString *anchor_city;



@end
