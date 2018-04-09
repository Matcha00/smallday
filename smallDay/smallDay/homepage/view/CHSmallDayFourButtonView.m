//
//  CHSmallDayFourButtonView.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/1.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayFourButtonView.h"
#import "CHSmallDayUpImage.h"

@implementation CHSmallDayFourButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void)setUp
{
    
    CGFloat btnWidth = 50;
    CGFloat janju = (CHScreenW - 200 - 40) / 3;
    NSArray *titleBtn = @[@"PASS卡",@"附近好店",@"精选主题",@"匠人匠心"];
    NSArray *titleImage = @[@"pass",@"fujinhaodian",@"jingxuanzhuanti",@"jiangrenjiangxin"];

    for (NSInteger i = 0; i<titleBtn.count; i++) {
        CHSmallDayUpImage *btn = [[CHSmallDayUpImage alloc]init];
        btn.width = btnWidth;
        btn.height = 40;
        btn.x = 20 + btnWidth * i + janju * i;
        btn.y = 10 ;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:titleBtn[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:titleImage[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pushView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    
}

- (void)pushView
{
    if (_buttonClick) {
        _buttonClick;
    }
    
    NSLog(@"000000");
}

@end
