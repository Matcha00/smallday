//
//  CHSmallDayUpImage.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/1.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayUpImage.h"

@implementation CHSmallDayUpImage

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setup

{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


- (instancetype)initWithFrame:(CGRect)frame


{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.x = (self.width - self.imageView.width) / 2;
    self.imageView.y = 0;
    self.imageView.width = self.imageView.width;
    self.imageView.height = self.imageView.height;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}
- (void)setHighlighted:(BOOL)highlighted
{
    
}
@end
