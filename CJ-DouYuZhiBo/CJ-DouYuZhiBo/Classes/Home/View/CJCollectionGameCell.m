//
//  CJCollectionGameCell.m
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import "CJCollectionGameCell.h"


@interface CJCollectionGameCell()



@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end








@implementation CJCollectionGameCell





- (void)setGroup:(CJAnchorGroup *)group
{
    if (_group != group)
    {
        _group = group;
        
        self.titleLabel.text = _group.tag_name;
        
        [self.iconImageView setImageWithURL:[NSURL URLWithString:self.group.icon_url] placeholderImage:[UIImage imageNamed:@"home_more_btn"]];
        
    }
}





- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}



@end






