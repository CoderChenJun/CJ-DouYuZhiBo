//
//  CJCollectionHeaderView.h
//  CJ-DouYuZhiBo
//
//  Created by Jingjing Huang on 16/11/7.
//  Copyright © 2016年 ChenJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJAnchorGroup.h"


@interface CJCollectionHeaderView : UICollectionReusableView


@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (nonatomic, strong) CJAnchorGroup *anchorGroup;



+ (CJCollectionHeaderView *)collectionHeaderView;



@end




