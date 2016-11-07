//
//  CJCollectionNormalCell.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCollectionNormalCell.h"

@implementation CJCollectionNormalCell



- (void)setAnchorModel:(CJAnchorModel *)anchorModel
{
    if (_anchorModel != anchorModel)
    {
        
        _anchorModel = anchorModel;
        
        
        // 0.取出在线人数显示的文字
        NSString *onlineStr = @"";
        if (anchorModel.online >= 10000)
        {
            onlineStr = [NSString stringWithFormat:@"%d万在线",(anchorModel.online) / 10000];
        }
        else
        {
            onlineStr = [NSString stringWithFormat:@"%d在线",anchorModel.online];
        }
        [self.onlineBtn setTitle:onlineStr forState:UIControlStateNormal];
        
        
        // 2.昵称的显示
        self.nickNameLabel.text = anchorModel.nickname;
        
        // 3.设置封面图片
        [self.iconImageView setImageWithURL:[NSURL URLWithString:anchorModel.vertical_src] placeholderImage:[UIImage imageNamed:@"live_cell_default_phone"]];
        
        
        // 4.房间名称
        self.roomNameLabel.text = anchorModel.room_name;
        
        
        
    }
}





@end
