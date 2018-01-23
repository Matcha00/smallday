//
//  CHWelcomeViewController.m
//  smallDay
//
//  Created by 陈欢 on 2017/12/29.
//  Copyright © 2017年 陈欢. All rights reserved.
//
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#import "CHWelcomeViewController.h"
#import <Masonry.h>

@interface CHWelcomeViewController ()

@property (nonatomic, strong) UIImageView *runImageView;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) NSArray *imageArray;

@property (nonatomic, assign) NSInteger lastindex;


@end

@implementation CHWelcomeViewController

- (NSTimer *)timer {
    
    if (!_timer) {
        _timer = [[NSTimer alloc]init];
    }
    
    return _timer;
}


- (NSArray *)imageArray {
    
    if (!_imageArray) {
        _imageArray = [[NSArray alloc]init];
    }
    
    return _imageArray;
}

- (UIImageView *)runImageView {
    if (!_runImageView) {
        _runImageView = [[UIImageView alloc]init];
    }
    return _runImageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = @[[UIImage imageNamed:@"LoginOne"],[UIImage imageNamed:@"LoginTwo"],[UIImage imageNamed:@"LoginThree"]];
    
    _runImageView.image = _imageArray[0];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    [self.view addSubview:_runImageView];
    WS(ws);
    
    [_runImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.right.left.equalTo(ws.view);
        
        
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeImage {
    
    
    
    
    
    
    
    if (self.lastindex < 3) {
        
        [UIView transitionWithView:self.runImageView duration:3.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.runImageView.image = self.imageArray[self.lastindex++];
        } completion:nil];
        
        
        
    } else {
        
        self.lastindex = 0;
        
        
    }
    
    
    
    
    
    
}

- (void)dealloc {
    
    if (_timer != nil) {
        [_timer invalidate];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
