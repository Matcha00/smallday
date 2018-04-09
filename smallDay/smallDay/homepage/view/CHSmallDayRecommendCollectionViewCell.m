//
//  CHSmallDayRecommendCollectionViewCell.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/5.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayRecommendCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface CHSmallDayRecommendCollectionViewCell()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLbael;
@property (nonatomic, strong) UIImageView *xinImage;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *address;

@end
@implementation CHSmallDayRecommendCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)configVIew
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CHScreenW / 2, CHScreenW / 4)];
        [_imageView sd_setImageWithURL:@""];
        _imageView.layer.cornerRadius = 5;
        _imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_imageView];
        
    }
    
    if (!_name) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(0, CHScreenW / 4, CHScreenW / 2, 20)];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLbael];
    }
    
    if (!_address) {
        _address = [[UILabel alloc]initWithFrame:CGRectMake(0, CHScreenW / 4 + 20, CHScreenW / 2, 20)];
        _address.textAlignment = NSTextAlignmentLeft;
        _address.font = [UIFont systemFontOfSize:13];
        _address.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_address];
    }
    
    if (!_xinImage) {
        _xinImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,CHScreenW / 4 + 40, 17, 17)];
        _xinImage.image = [UIImage imageNamed:@"elike"];
        [self.contentView addSubview:_xinImage];
    }
    
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, CHScreenW / 4 + 60, CHScreenW/2 - 17, 20)];
        _amountLabel.font = [UIFont systemFontOfSize:13];
        _amountLabel.textAlignment = NSTextAlignmentLeft;
        _amountLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_amountLabel];
    }
}
@end
