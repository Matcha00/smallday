//
//  CHSmallDayHeaderCollectionReusableView.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayHeaderCollectionReusableView.h"
@interface CHSmallDayHeaderCollectionReusableView()

@property (nonatomic, strong) UILabel *headerLbael;

@end


@implementation CHSmallDayHeaderCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}


- (void)setHeaderTitle:(NSString *)headerTitle
{
    _headerTitle = headerTitle;
    
    if (!_headerLbael) {
        _headerLbael = [[UILabel alloc]init];
        _headerLbael.textAlignment = NSTextAlignmentCenter;
        _headerLbael.text = headerTitle;
        _headerLbael.textColor = [UIColor blackColor];
        _headerLbael.backgroundColor = [UIColor grayColor];
        _headerLbael.font = [UIFont systemFontOfSize:18];
        [self addSubview:_headerLbael];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.headerLbael.frame = self.bounds;
}
@end


