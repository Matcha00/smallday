//
//  CHSmallDayShowUserCollectionViewCell.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/5.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayShowUserCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "ChsmalldayshowusermodelModel.h"
@implementation CHSmallDayShowUserCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setShop:(ChsmalldayshowusermodelModel *)shop
{
    _shop = shop;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    //if (shop.user__avatar) {
    [imageView setYaun:shop.user__avatar];
    imageView.backgroundColor = [UIColor redColor];
    //}
    [self.contentView addSubview:imageView];
}




@end
