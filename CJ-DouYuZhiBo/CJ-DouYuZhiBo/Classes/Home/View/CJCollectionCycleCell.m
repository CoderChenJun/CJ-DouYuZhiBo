//
//  CJCollectionCycleCell.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCollectionCycleCell.h"

@implementation CJCollectionCycleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setCycleModel:(CJCycleModel *)cycleModel
{
    
    if (_cycleModel != cycleModel)
    {
        _cycleModel = cycleModel;
        
        
        self.titleLabel.text = _cycleModel.title;
        
        [self.iconImageView setImageWithURL:[NSURL URLWithString:_cycleModel.pic_url] placeholderImage:[UIImage imageNamed:@"Img_default"]];
        
    }
    
}


@end
