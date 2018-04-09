//
//  CHSmallDayTineLable.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayTineLable.h"

@implementation CHSmallDayTineLable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *pathLable = [UIBezierPath bezierPath];
    
    //CGPoint p = CGPointMake(50,0);
    [pathLable moveToPoint:CGPointMake(0, 0)];
    [pathLable addLineToPoint:CGPointMake(self.bounds.size.width,0)];
    
   // NSLog(@"3 middle point %@", NSStringFromCGPoint(p));
    
    [pathLable addLineToPoint:CGPointMake(self.bounds.size.width - 20,self.bounds.size.height / 2)];
    
    [pathLable addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [pathLable addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    //[pathLable addLineToPoint:CGPointMake(self.bounds.size.width - 10, self.bounds.size.height)];
    
    
    pathLable.lineWidth = 1;
    pathLable.lineJoinStyle = kCGLineJoinMiter;
    [pathLable closePath];
    [[UIColor whiteColor] setFill];
    [[UIColor redColor]setStroke];
    [pathLable fill];
    
    [super drawRect:rect];
}

@end
