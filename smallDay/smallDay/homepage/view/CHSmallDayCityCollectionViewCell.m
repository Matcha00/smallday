//
//  CHSmallDayCityCollectionViewCell.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayCityCollectionViewCell.h"
@interface CHSmallDayCityCollectionViewCell()


@property (nonatomic, strong) UILabel *cityLable;

@end
@implementation CHSmallDayCityCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setCityName:(NSString *)cityName
{
    _cityName = cityName;
    
    if (!_cityLable) {
        _cityLable = [[UILabel alloc]init];
        _cityLable.textColor = [UIColor blackColor];
        _cityLable.text = cityName;
        _cityLable.textAlignment = NSTextAlignmentCenter;
        _cityLable.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_cityLable];
        
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _cityLable.frame = self.bounds;
}

@end
