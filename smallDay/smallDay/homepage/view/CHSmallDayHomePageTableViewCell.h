//
//  CHSmallDayHomePageTableViewCell.h
//  smallDay
//
//  Created by 陈欢 on 2018/1/29.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHSmallShopCurrentObjectsModel;
@interface CHSmallDayHomePageTableViewCell : UITableViewCell

@property (nonatomic, strong) CHSmallShopCurrentObjectsModel *shopModel;
@property (nonatomic, strong) void (^btnLikeClick)();
@property (copy, nonatomic) void (^cellRefreshBlock)();
@end
