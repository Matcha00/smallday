//
//  CHSmallDayTagCollectionViewCell.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayTagCollectionViewCell.h"
#import "CHSmallDayTineLable.h"
#import <UIImageView+WebCache.h>
#import "HomePageModel.h"

@interface CHSmallDayTagCollectionViewCell()

@property (nonatomic, strong) UIImageView *tagImageView;
@property (nonatomic, strong) CHSmallDayTineLable *tagLable;
@property (nonatomic, strong) UILabel *nameLable;

@end


@implementation CHSmallDayTagCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setTagModel:(CHTagDataModel *)tagModel
{
    _tagModel = tagModel;
    
    if (!_tagImageView) {
        _tagImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, 120)];
        _tagImageView.contentMode = UIViewContentModeScaleToFill;
        _tagImageView.clipsToBounds = YES;
        _tagImageView.layer.cornerRadius = 6.0;
        _tagImageView.layer.masksToBounds = YES;
        [_tagImageView sd_setImageWithURL:[NSURL URLWithString:tagModel.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [self.contentView addSubview:_tagImageView];
       
        
    }
    
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, self.contentView.width, 20)];
        _nameLable.text = tagModel.name;
        _nameLable.textAlignment = NSTextAlignmentCenter;
        _nameLable.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_nameLable];
    }
    
    if (!_tagLable) {
        _tagLable = [[CHSmallDayTineLable alloc]init];
        NSString *name = [NSString stringWithFormat:@"%ld",(long)tagModel.shopcnt];
        NSString *home = @"家";
        NSString *nameHome = [name stringByAppendingString:home];
        _tagLable.text = nameHome;
        _tagLable.font = [UIFont systemFontOfSize:12];
        [self.tagImageView addSubview:_tagLable];
    }
}


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    _tagLable.x = 0;
    _tagLable.y = 80;
    _tagLable.width = 50;
    _tagLable.height = 20;
}



@end
