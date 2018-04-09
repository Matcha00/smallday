//
//  CHSmallDayCellHeader.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/1.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayCellHeader.h"
@implementation CHSmallDayCellHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CHScreenW, 20)];
        name.text = @"好店";
        name.font = [UIFont systemFontOfSize:16];
        name.textAlignment = NSTextAlignmentCenter;
        [self addSubview:name];
        UILabel *des = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, CHScreenW, 20)];
        des.text = @"去了解 从日出到日落";
        des.textAlignment = NSTextAlignmentCenter;
        des.font = [UIFont systemFontOfSize:13];
        des.textColor = [UIColor grayColor];
        [self addSubview:des];
        
    }
    return self;
}
@end
