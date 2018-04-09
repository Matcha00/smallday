//
//  CHSmallDayLoading.h
//  smallDay
//
//  Created by 陈欢 on 2018/2/3.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHSmallDayLoading : UIView


-(void)start;
-(void)stop;

+(void)showInView:(UIView*)view;

+(void)hideInView:(UIView*)view;

@end
