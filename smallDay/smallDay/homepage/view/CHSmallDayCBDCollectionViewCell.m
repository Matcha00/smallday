//
//  CHSmallDayCBDCollectionViewCell.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/21.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayCBDCollectionViewCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "HomePageModel.h"

@interface CHSmallDayCBDCollectionViewCell()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *nameText;
@property (nonatomic, strong) UILabel *listLable;

@end



@implementation CHSmallDayCBDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setCbdModel:(CHCBDDataModel *)cbdModel
{
    _cbdModel = cbdModel;
    if (!_imgView) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.contentView.width,80)];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.clipsToBounds = YES;
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 6.0;
        
        [_imgView sd_setImageWithURL:[NSURL URLWithString:cbdModel.img] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [self.contentView addSubview:_imgView];
        
    }
    
    if (!_nameText) {
        _nameText  = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, CHScreenW * 0.5 - 20, 20)];
        _nameText.textColor = [UIColor blackColor];
        _nameText.textAlignment = NSTextAlignmentLeft;
        _nameText.font = [UIFont systemFontOfSize:12];
        _nameText.text = cbdModel.name;
        
        [self.contentView addSubview:_nameText];
    }
    
    if (!_listLable) {
        _listLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, CHScreenW * 0.5 - 20, 20)];
        _listLable.textColor = [UIColor grayColor];
        _listLable.font = [UIFont systemFontOfSize:13];
        _listLable.textAlignment = NSTextAlignmentLeft;
        _listLable.text = cbdModel.intro;
        [self.contentView addSubview:_listLable];
    }
    
    
    
}

@end
