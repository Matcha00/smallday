//
//  CHSmallDayHomePageTableViewCell.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/29.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayHomePageTableViewCell.h"
#import "CHSmallShopModel.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>

@interface CHSmallDayHomePageTableViewCell()

@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIButton *xinButton;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UILabel *areaLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *titleLbale;
@property (nonatomic, strong) UIImageView *cellimageView;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIView *tarView;


@end

@implementation CHSmallDayHomePageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configView];
    }
    
    return self;
}

- (void)configView
{
    if (!_cellimageView) {
        _cellimageView = [[UIImageView alloc]init];
        _cellimageView.userInteractionEnabled = YES;
       
        [self.contentView addSubview:_cellimageView];
        //NSLog(@"%@", shopModel.img);
        
        
        
    }
    
    
    if (!_likeButton) {
        _likeButton = [[UIButton alloc]init];
        [_likeButton setImage:[UIImage imageNamed:@"collect_2"] forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"shoucang-2"] forState:UIControlStateSelected];
        //[_likeButton setSelected:YES];
        [_likeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.cellimageView addSubview:_likeButton];
        
        
    }
    
    if (!_tarView) {
        _tarView  = [[UIView alloc]init];
        _tarView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_tarView];
    }
    
    if (!_titleLbale) {
        _titleLbale = [[UILabel alloc]init];
        
        _titleLbale.font = [UIFont systemFontOfSize:16];
        //_titleLbale.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_titleLbale];
    }
    
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc]init];
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.font = [UIFont systemFontOfSize:13];
        _amountLabel.textColor = [UIColor grayColor];
       
        //_amountLabel.backgroundColor = [UIColor redColor];
        [self.tarView addSubview:_amountLabel];
    }
    
    if (!_areaLabel) {
        _areaLabel = [[UILabel alloc]init];
                _areaLabel.textColor = [UIColor grayColor];
        _areaLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_areaLabel];
    }
    
    if (!_desLabel) {
        _desLabel = [[UILabel alloc]init];
       
        _desLabel.textColor = [UIColor grayColor];
        _desLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_desLabel];
    }

}

- (void)setShopModel:(CHSmallShopCurrentObjectsModel *)shopModel
{
    _shopModel = shopModel;
    
     [_cellimageView sd_setImageWithURL:[NSURL URLWithString:shopModel.img] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    _titleLbale.text = shopModel.title;
    
    _areaLabel.text = shopModel.area;

     _desLabel.text = shopModel.name;
    
    NSString *like = [NSString stringWithFormat:@"%ld", (long)shopModel.likenum];
    NSString *likeString = [like stringByAppendingString:@"人想去"];
    _amountLabel.text = likeString;
    
}

- (void)buttonClick:(UIButton *)btn
{
    
    NSLog(@"---------");
    BOOL userLike = _shopModel.hasLiked;
    if (_btnLikeClick) {
        _btnLikeClick();
    
    }
    if (!userLike) {
        [btn setSelected:!btn.selected];
    }
    
    
    
    
    
    
    
    
    //btn.selected = !btn.selected;
    
   
}
- (CGFloat)autoWidthString:(NSString *)string withLabel:(UILabel *)label{
    
    CGSize size = [string sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.frame.size.height)];
    
    return size.width;
    
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 5;
    frame.origin.y += 5;
    frame.size.height -= 10;
    frame.size.width -= 10;
    [super setFrame:frame];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _cellimageView.frame = CGRectMake(0, 0,self.width, CHScreenW - 120);
    
    _tarView.frame = CGRectMake(0, _cellimageView.height, _cellimageView.width, 70);
    
    //_likeButton.frame = CGRectMake(0, 0, 40, 40);
    
    CHweakSelf;
    
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.cellimageView.mas_top).mas_offset(5);
        make.right.mas_equalTo(weakSelf.cellimageView.mas_right).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
        
        
    }];
    
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.tarView.mas_top).mas_offset(10);
        make.right.mas_equalTo(weakSelf.tarView.mas_right).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(CHScreenW / 5, 20));
     
    }];
    //[_amountLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    //[_amountLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [_titleLbale mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.tarView.mas_top).mas_offset(10);
        make.left.mas_equalTo(weakSelf.tarView.mas_left).mas_offset(5);
        make.size.mas_equalTo(CGSizeMake(CHScreenW - 120 , 20));
        //make.right.mas_equalTo(weakSelf.tarView.mas_right).mas_equalTo(-120);
        
    }];
    
    
//    [_desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       
////        make.right.mas_equalTo(weakSelf.tarView.mas_left).mas_offset(10);
////        make.bottom.mas_equalTo(weakSelf.tarView.mas_bottom).mas_offset(0);
////        make.size.height.mas_equalTo(20);
////        make.right.mas_equalTo(weakSelf.tarView).mas_offset(-120);
//        
//        make.bottom.mas_equalTo(weakSelf.tarView.mas_bottom).mas_offset(-15);
//        make.left.mas_equalTo(weakSelf.tarView.mas_left).mas_offset(5);
//        make.size.height.mas_equalTo(20);
//        //make.right.mas_equalTo(weakSelf.tarView.mas_right).mas_equalTo(-120);
//        
//    }];
//    
//   // [_desLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh
//                                         forAxis:UILayoutConstraintAxisHorizontal];
//    
//    [_areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.mas_equalTo(weakSelf.desLabel.mas_right).mas_offset(10);
//        make.right.lessThanOrEqualTo(weakSelf.tarView.mas_right).mas_offset(-20);
//        make.size.height.mas_equalTo(20);
//        make.bottom.mas_equalTo(weakSelf.tarView.mas_bottom).mas_offset(-15);
//    }];
    [_desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.tarView.mas_bottom).with.offset(-5);
        make.left.equalTo(weakSelf.tarView.mas_left).with.offset(5);
        // 40高度
        make.height.equalTo(@40);
    }];
    // label2: 位于右上角
    [_areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //左边贴着label1，间隔2
        make.left.equalTo(weakSelf.desLabel.mas_right).with.offset(20);
        //上边贴着父view，间隔5
        make.bottom.equalTo(weakSelf.tarView.mas_bottom).with.offset(-5);
        //右边的间隔保持大于等于2，注意是lessThanOrEqual
        //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
        //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
        make.right.lessThanOrEqualTo(weakSelf.tarView.mas_right).with.offset(-2);
        //只设置高度40
        make.height.equalTo(@40);
    }];
    
    [_desLabel setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    //设置label1的content compression 为1000
    [_desLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];
    //设置右边的label2的content hugging 为1000
    [_areaLabel setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    //设置右边的label2的content compression 为250
    [_areaLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];


    
}
@end
