//
//  ChsmalldayreshopmodelModel.h
//  JsonToModelConverter
//
//  Created by JsonToModelConverter.
//  Copyright © JsonToModelConverter. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Formated_VipModel;
@class SpaceModel;

@interface ChsmalldayreshopmodelModel : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, strong) NSString *geohash;
@property (nonatomic, strong) Formated_VipModel *formated_vip;
@property (nonatomic, strong) NSString *recommend_reason;
@property (nonatomic, strong) NSNumber *upt;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *cbd;
@property (nonatomic, strong) NSString *m_url;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSNumber *avg_cost;
@property (nonatomic, strong) NSNumber *likenum;
@property (nonatomic, strong) NSString *small_tip;
@property (nonatomic, strong) NSNumber *lng;
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) SpaceModel *space_tag;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *root_type;

@end

