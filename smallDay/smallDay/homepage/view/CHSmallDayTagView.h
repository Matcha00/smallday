//
//  CHSmallDayTagView.h
//  smallDay
//
//  Created by 陈欢 on 2018/1/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHSmallDayTagView : UIView

@property (nonatomic, strong) NSArray *tagArray;

- (void)reloadData;

@end
