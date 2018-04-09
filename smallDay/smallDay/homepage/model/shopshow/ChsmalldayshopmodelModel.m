//
//  ChsmalldayshopmodelModel.m
//  JsonToModelConverter
//
//  Created by JsonToModelConverter.
//  Copyright © JsonToModelConverter. All rights reserved.
//

#import "ChsmalldayshopmodelModel.h"

@implementation CHMore



@end

@implementation CHShop



@end


@implementation ChsmalldayshopmodelModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"tips":@"TipsModel",
             @"more":@"CHMore",
             @"shop":@"CHShop"
             };
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}

@end

