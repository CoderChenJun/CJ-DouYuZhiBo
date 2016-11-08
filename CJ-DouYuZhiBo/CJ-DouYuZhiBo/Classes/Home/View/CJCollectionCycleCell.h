//
//  CJCollectionCycleCell.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/8.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJCycleModel.h"


@interface CJCollectionCycleCell : UICollectionViewCell


@property (nonatomic, strong) CJCycleModel *cycleModel;


@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end




