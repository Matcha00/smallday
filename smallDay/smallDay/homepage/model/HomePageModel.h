//
//  HomePageModel.h
//  smallDay
//
//  Created by 陈欢 on 2018/1/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CHBannerModel : NSObject
@property (nonatomic, assign) NSInteger hasliked;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, assign) NSInteger roottype;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *img;
@end
@interface CHVIPModel : NSObject
@property (nonatomic, strong) NSString *for_vip_full;
@property (nonatomic, strong) NSString *for_vip_short;

@end
@interface CHAddress : NSObject
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, assign) NSInteger avg_cost;
@property (nonatomic, strong) NSString *cbd;
@property (nonatomic, strong) CHVIPModel *vip;
@end
@interface CHSpaceModel : NSObject
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *icon_map;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger shopcnt;
@property (nonatomic, assign) NSInteger tag_type;

@end
@interface CHCurrentModel : NSObject
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
@property (nonatomic, strong) CHVIPModel *vipModel;
@property (nonatomic, strong) CHSpaceModel *spaceModel;


@end

@interface CHShopModel : NSObject

@end

@interface CHCBDDataModel : NSObject
@property (nonatomic, strong) NSString *coord;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger radius;
@property (nonatomic, assign) NSInteger shopnum;
@property (nonatomic, strong) NSArray *shops;
@end

@interface CHShopDataModel : NSObject
@property (nonatomic, assign) NSInteger cupage;
@property (nonatomic, assign) NSInteger nextpage;
@property (nonatomic, strong) NSArray <CHCurrentModel *> *currentModel;
@end

@interface CHTagDataModel : NSObject
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *iconMap;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger shopcnt;
@property (nonatomic, assign) NSInteger tagType;
@end


@interface CHFirstModel : NSObject

@property (nonatomic, strong) NSArray *adsdata;
@property (nonatomic, strong) NSArray <CHBannerModel *> *banner;
@property (nonatomic, strong) NSArray <CHCBDDataModel *> *cbdData;
@property (nonatomic, strong) CHShopDataModel *shopData;
@property (nonatomic, strong) NSArray <CHTagDataModel *> *tagData;
@property (nonatomic, assign) NSInteger *code;
@property (nonatomic, strong) NSArray *testlist;
@property (nonatomic, strong) NSString *msg;

@end


