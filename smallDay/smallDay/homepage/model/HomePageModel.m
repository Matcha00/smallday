//
//  HomePageModel.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "HomePageModel.h"

@implementation CHBannerModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id",
             @"hasliked" : @"has_liked",
             @"roottype": @"root_type"};
}

//+ (NSDictionary *)modelContainerPropertyGenericClass {
  //  return @{@"buttons" : [WBButtonLink class]};
//}

@end

@implementation CHFirstModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"banner" : [CHBannerModel class],
             @"cbdData" : [CHCBDDataModel class],
             @"tagData" : [CHTagDataModel class]};
}



@end

@implementation CHTagDataModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

@end

@implementation CHShopModel



@end

@implementation CHCBDDataModel

//+ (NSDictionary *)modelCustomPropertyMapper {
  //  return @{@"ID" : @"id"};
//}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"shops" : @"CHShopModel"
             };
}

@end

@implementation CHAddress

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"vip" : [CHVIPModel class]};
}


@end

@implementation CHVIPModel



@end

@implementation CHSpaceModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

@end


@implementation CHCurrentModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

@end

@implementation CHShopDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"currentModel" : [CHCurrentModel class]};
}

@end














