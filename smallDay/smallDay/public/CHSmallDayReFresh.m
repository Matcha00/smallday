//
//  CHSmallDayReFresh.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/30.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayReFresh.h"
@interface CHSmallDayReFresh()

@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UIImageView *zanImage;
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UISwitch *s;
@property (weak, nonatomic) UIImageView *logo;
@property (weak, nonatomic) UIActivityIndicatorView *loading;
@end
@implementation CHSmallDayReFresh

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    //self.backgroundColor = [UIColor redColor];
    // logo
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zanimabg"]];
    bgImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:bgImage];
    self.bgImage = bgImage;
    
    UIImageView *zanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zanima"]];
    zanImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.bgImage addSubview:zanImage];
    self.zanImage = zanImage;
    
    
  
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    

    
    self.bgImage.size = CGSizeMake(32, 39);
    self.bgImage.center = CGPointMake(self.mj_w / 2, self.mj_h / 2);
    
    self.zanImage.size = CGSizeMake(8, 20);
    self.zanImage.center = CGPointMake(self.bgImage.width / 2, self.bgImage.height / 2);
    
   
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
           
        case MJRefreshStatePulling:
            
            break;
        case MJRefreshStateRefreshing:
            
            [self.zanImage.layer addAnimation:[self getTransformAnimation] forKey:nil];

           
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
   
    //self.label.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

-(CABasicAnimation *)getTransformAnimation{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.rotation"]; //指定对transform.rotation属性做动画
    animation.duration            = 4.0f; //设定动画持续时间
    animation.byValue             = @(M_PI*2); //设定旋转角度，单位是弧度
    animation.fillMode            = kCAFillModeForwards;//设定动画结束后，不恢复初始状态之设置一
    animation.repeatCount         = 100;//设定动画执行次数
    animation.removedOnCompletion = NO;//设定动画结束后，不恢复初始状态之设置二
    return animation;
}

- (void)endRefreshing
{
    [self.zanImage.layer removeAllAnimations];
    
    [super endRefreshing];
}

@end
