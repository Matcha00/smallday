//
//  CHSmallShopModel.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallShopModel.h"
#import <MJExtension.h>


@implementation CHSmallShopCurrentObjectsModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id",
             @"avgCost" : @"avg_cost",
             @"hasLiked" : @"has_liked",
             @"mUrl" : @"m_url",
             @"recommendReason" : @"recommend_reason",
             @"rootType" : @"root_type",
             @"smallTip" : @"small_tip"};
}
 

@end

@implementation CHSmallShopFormatedVipModel



@end

@implementation CHSmallShopSpaceTagModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}




@end
@implementation CHSmallDayShopModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"current_objects" :@"CHSmallShopCurrentObjectsModel"
             };
}


@end
