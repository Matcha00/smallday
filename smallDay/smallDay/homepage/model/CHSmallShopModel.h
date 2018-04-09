//
//  CHSmallShopModel.h
//  smallDay
//
//  Created by 陈欢 on 2018/1/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CHSmallShopFormatedVipModel : NSObject
@property (nonatomic, assign) NSInteger for_vip_short;
@property (nonatomic, assign) NSInteger for_vip_full;
@end

@interface CHSmallShopSpaceTagModel : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *icon_map;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger shopcnt;
@property (nonatomic, assign) NSInteger tag_type;

@end


@interface CHSmallShopCurrentObjectsModel : NSObject

/*
@property (nonatomic, assign) NSInteger lng;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *likenum;
@property (nonatomic, assign) BOOL has_like;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *cbd;
@property (nonatomic, assign) NSInteger lat;
@property (nonatomic, strong) NSString *m_url;
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, assign) NSInteger small_tip;
@property (nonatomic, strong) NSString *recommend_reason;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *upt;
@property (nonatomic, strong) NSString *avg_cost;
@property (nonatomic, strong) NSString *geohash;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) CHSmallShopSpaceTagModel *spaceTag;
@property (nonatomic, strong) CHSmallShopFormatedVipModel *forVIp;
 */


@property (nonatomic, strong) NSString * area; 
@property (nonatomic, assign) NSInteger avgCost;
@property (nonatomic, strong) NSString * cbd;
@property (nonatomic, strong) CHSmallShopSpaceTagModel *space_tag;
@property (nonatomic, strong) NSString * geohash;
@property (nonatomic, assign) BOOL hasLiked;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) NSInteger likenum;
@property (nonatomic, assign) CGFloat lng;
@property (nonatomic, strong) NSString * mUrl;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * recommendReason;
@property (nonatomic, assign) NSInteger rootType;
@property (nonatomic, strong) NSString * smallTip;
@property (nonatomic, strong) CHSmallShopFormatedVipModel *formated_vip;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger upt;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *address;
@end
@interface CHSmallDayShopModel : NSObject

@property (nonatomic, strong) NSString *cupage;
@property (nonatomic, strong) NSArray *current_objects;
@property (nonatomic, strong) NSString *nextpage;

@end
