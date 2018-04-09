//
//  UIImage+Yuan.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/5.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "UIImage+Yuan.h"

@implementation UIImage (Yuan)


- (UIImage *)circleImage
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1);
    //CGContextSetStrokeColor(context, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    [self drawInRect:rect];
    
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    
    UIImage *nem = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return nem;
    
    
}


@end
