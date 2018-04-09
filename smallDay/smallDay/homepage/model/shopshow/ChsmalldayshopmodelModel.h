//
//  ChsmalldayshopmodelModel.h
//  JsonToModelConverter
//
//  Created by JsonToModelConverter.
//  Copyright © JsonToModelConverter. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Formated_VipModel;
@class Recommend_UserModel;
@class SpaceModel;
@class Shop_OwnerModel;


@interface ChsmalldayshopmodelModel : NSObject

@property (nonatomic, strong) Formated_VipModel *formated_vip;
@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, strong) NSString *shareURL;
@property (nonatomic, strong) NSString *shop_time;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSNumber *avg_cost;
@property (nonatomic, strong) Recommend_UserModel *recommend_user;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) SpaceModel *space;
@property (nonatomic, strong) NSString *small_tip;
@property (nonatomic, strong) NSNumber *root_type;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSNumber *look;
@property (nonatomic, strong) NSNumber *shop_id;
@property (nonatomic, strong) NSNumber *per;
@property (nonatomic, strong) NSNumber *has_liked;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *open_time;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) Shop_OwnerModel *shop_owner;
@property (nonatomic, strong) NSString *recommend;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *more;
@property (nonatomic, strong) NSString *shop_keeper_wx;
@property (nonatomic, strong) NSNumber *likenum;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *share_url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *shop;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSArray *tips;
@property (nonatomic, strong) NSNumber *signin;
@property (nonatomic, strong) NSNumber *classify_type;

@end

@interface CHMore : NSObject


@end

@interface CHShop : NSObject

@end

