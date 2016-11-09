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





- (void)setBaseGame:(CJBaseGameModel *)baseGame
{
    if (_baseGame != baseGame)
    {
        _baseGame = baseGame;
        
        self.titleLabel.text = _baseGame.tag_name;
        
        [self.iconImageView setImageWithURL:[NSURL URLWithString:self.baseGame.icon_url] placeholderImage:[UIImage imageNamed:@"home_more_btn"]];
        
    }
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}



@end






