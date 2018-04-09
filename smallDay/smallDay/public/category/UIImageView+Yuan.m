//
//  UIImageView+Yuan.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/5.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "UIImageView+Yuan.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (Yuan)

- (void)setYaun:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"jjjjj"] circleImage];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {//当图片下载完会来到这个block，执行以下代码
        
        self.image = image ? [image circleImage] : placeholder;
        
    }];
    
    }



@end
