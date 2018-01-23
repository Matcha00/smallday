//
//  CHBannerList.h
//  smallDay
//
//  Created by 陈欢 on 2018/1/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHBannerList : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) NSInteger has_liked;
@property (nonatomic, assign) NSInteger root_type;


@end

