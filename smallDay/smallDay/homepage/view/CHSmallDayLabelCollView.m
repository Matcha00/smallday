//
//  CHSmallDayLabelCollView.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/4.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayLabelCollView.h"
#import <Masonry.h>
#import "ChsmalldayshopmodelModel.h"
@interface CHSmallDayLabelCollView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *nameLbel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIButton *phoneButton;
@property (nonatomic, strong) UIButton *mapButton;
@property (nonatomic, strong) UIImageView *fgxImage;

@end
@implementation CHSmallDayLabelCollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self congfigView];
    }
    return self;
}


- (void)congfigView
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //_titleLabel.text = @"hhhhhhhhhhhh";
        [self addSubview:_titleLabel];
    }
    
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc]init];
        _tagLabel.font = [UIFont systemFontOfSize:13];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        _tagLabel.textColor = [UIColor lightGrayColor];
        //_tagLabel.text = @"hhhh";
        [self addSubview:_tagLabel];
    }

    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textColor = [UIColor lightGrayColor];
        //_timeLabel.text = @"fffff";
        [self addSubview:_timeLabel];
    }

    if (!_nameLbel) {
        _nameLbel = [[UILabel alloc]init];
        _nameLbel.font = [UIFont systemFontOfSize:13];
        _nameLbel.textAlignment = NSTextAlignmentLeft;
        _nameLbel.textColor = [UIColor lightGrayColor];
        //_nameLbel.text = @"kkkkkkkkkkkkkkkkkkkkkkkkkk";
        //_nameLbel.backgroundColor = [UIColor redColor];
        [self addSubview:_nameLbel];
    }

    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.textColor = [UIColor lightGrayColor];
        //_addressLabel.text = @"kkkkkkkkkkkkkkkkkkkkkkkkkk";
        //_addressLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_addressLabel];
    }
    
    if (!_phoneButton) {
        _phoneButton = [[UIButton alloc]init];
        [_phoneButton setImage:[UIImage imageNamed:@"phone_1"] forState:UIControlStateNormal];
        [_phoneButton addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_phoneButton];
    }
    
    if (!_mapButton) {
        _mapButton = [[UIButton alloc]init];
        [_mapButton setImage:[UIImage imageNamed:@"navigation_1"] forState:UIControlStateNormal];
        [_mapButton addTarget:self action:@selector(pushMap) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_mapButton];
    }
    
    if (!_fgxImage) {
        _fgxImage = [[UIImageView alloc]init];
        _fgxImage.image = [UIImage imageNamed:@"xuxian"];
        [self addSubview:_fgxImage];
    }

    
    
}


- (void)callPhone
{
    
}

- (void)pushMap
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CHweakSelf;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(CHScreenW, 20));
    }];
    
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(CHScreenW, 10));
        
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.tagLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(weakSelf.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(CHScreenW, 10));
    }];
    
    [self.fgxImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.timeLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(30);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-30);
        make.size.height.mas_equalTo(1);

    }];
    
    [self.nameLbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-70);
        make.size.height.mas_equalTo(20);
        make.top.mas_equalTo(weakSelf.fgxImage.mas_bottom).offset(30);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-70);
        make.size.height.mas_equalTo(20);
        make.top.mas_equalTo(weakSelf.nameLbel.mas_bottom).offset(30);
    }];
    
    [self.phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.right.mas_equalTo(weakSelf.mas_right).offset(-20);
        make.top.mas_equalTo(weakSelf.fgxImage.mas_bottom).offset(20);
    }];
    
    [self.mapButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.right.mas_equalTo(weakSelf.mas_right).offset(-20);
        make.top.mas_equalTo(weakSelf.phoneButton.mas_bottom).offset(0);
    }];
}


- (void)setShop:(ChsmalldayshopmodelModel *)shop
{
    _shop = shop;
    
    NSString *phone = shop.phone;
    NSString *nameShop = shop.name;
    NSString *name = [nameShop stringByAppendingString:phone];
    
    self.titleLabel.text = shop.title;
    self.timeLabel.text = shop.open_time;
    self.addressLabel.text = shop.address;
    self.nameLbel.text = name;
    self.tagLabel.text  = shop.tag;
}




@end
