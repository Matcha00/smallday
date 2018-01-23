//
//  CHSmallDayBanner.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayBanner.h"
#import <SDCycleScrollView.h>
#import "CHBannerList.h"

@interface CHSmallDayBanner() <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *bannerView;

@property (nonatomic, strong) NSMutableArray *bannerArray;
@end


@implementation CHSmallDayBanner

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setSize:CGSizeMake(CHScreenW, 200)];
    }
    
    return self;
}

- (NSMutableArray *)bannerArray {
    if (!_bannerArray) {
        _bannerArray = [[NSMutableArray alloc]init];
    }
    
    return _bannerArray;
}

- (void)setCurBannerList:(NSArray *)curBannerList
{
    _curBannerList = curBannerList;
    
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CHScreenW, 200) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        for (CHBannerList *list in _curBannerList) {
            [self.bannerArray addObject:list.img];
            //NSLog(@"%@", self.bannerArray);
        }
        
        _bannerView.imageURLStringsGroup = _bannerArray;
        [self addSubview:_bannerView];
    }
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"-----------");
}

@end
