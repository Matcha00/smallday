//
//  CHSmallDayLoading.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/3.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayLoading.h"
@interface CHSmallDayLoading()
@property (nonatomic, strong) UIView *bg;
@property (nonatomic, strong) UIView *bgImageView;
@property (nonatomic, strong) UIImageView *bgIamge;
@property (nonatomic, strong) UIImageView *zanImage;
@property (nonatomic, assign) _Bool isStop;
@end
@implementation CHSmallDayLoading

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
        
        [self settingView];
    
    }
    return self;
}

- (void)settingView
{
    self.backgroundColor = [UIColor redColor];
    
    if (!_bg) {
        _bg = [[UIView alloc]initWithFrame:self.bounds];
        _bg.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bg];
    }
    
    if (!_bgImageView) {
        _bgImageView = [[UIView alloc]init];
        _bgImageView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_bgImageView];
    }
    
    if (!_bgIamge) {
        _bgIamge = [[UIImageView alloc]init];
        _bgIamge.image = [UIImage imageNamed:@"zanimabg"];
        //_bgIamge.backgroundColor = [UIColor redColor];
        [self addSubview:_bgIamge];
    }
    
    if (!_zanImage) {
        _zanImage = [[UIImageView alloc]init];
        _zanImage.image = [UIImage imageNamed:@"zanima"];
        //[self.zanImage.layer addAnimation:[self getTransformAnimation] forKey:nil];
        //_zanImage.backgroundColor = [UIColor yellowColor];
        [self addSubview:_zanImage];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bgImageView.size = CGSizeMake(100, 100);
    _bgImageView.center = self.bg.center;
    NSLog(@"%@", NSStringFromCGPoint(self.bg.center));
    
    _bgIamge.size = CGSizeMake(32, 39);

    _bgIamge.center = self.center;
    _zanImage.size = CGSizeMake(8, 20);
    _zanImage.center = self.bgIamge.center;
    
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


- (void)startLoading
{
    [self.zanImage.layer addAnimation:[self getTransformAnimation] forKey:nil];
    
    self.hidden = NO;
}

- (void)endvLodaing
{
    self.hidden = YES;
}

- (void)start
{
    [self startLoading];
    _isStop = false;
}

- (void)stop
{
    _isStop = true;
    [_zanImage.layer removeAllAnimations];
    [_zanImage removeFromSuperview];
    [_bgIamge removeFromSuperview];
    [_bgImageView removeFromSuperview];
    [_bg removeFromSuperview];
    
}

+(void)showInView:(UIView*)view
{
    [self hideInView:view];
    
    CHSmallDayLoading *load = [[CHSmallDayLoading alloc]initWithFrame:view.bounds];
    [view addSubview:load];
    [load start];
}

+(void)hideInView:(UIView*)view
{
    for (CHSmallDayLoading *load in view.subviews) {
        if ([load isKindOfClass:[CHSmallDayLoading class]]) {
            
            [UIView animateWithDuration:1 animations:^{
                [load stop];
                
                
                [load removeFromSuperview];

            }];
            
                    }
    }
}







@end
