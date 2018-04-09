//
//  SpaceModel.h
//  JsonToModelConverter
//
//  Created by JsonToModelConverter.
//  Copyright © JsonToModelConverter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpaceModel : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, strong) NSNumber *tag_type;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *shopcnt;
@property (nonatomic, strong) NSString *icon_map;

@end

