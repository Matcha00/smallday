//
//  ViewController.m
//  smallDay
//
//  Created by 陈欢 on 2017/12/5.
//  Copyright © 2017年 陈欢. All rights reserved.
//

#import "ViewController.h"
#import "CHNetWorking.h"
#import "CHSmallDayBanner.h"
#import <YYModel.h>
#import "CHBannerList.h"
#import "HomePageModel.h"
#import <MJExtension.h>
#import "CHSmallDayCBDView.h"
#import "HomePageModel.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *kkkkk;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) NSArray *imageArray;

@property (nonatomic, assign) NSInteger lastindex;

@property (nonatomic, assign) NSInteger currentindex;

@property (nonatomic, copy) NSMutableArray *bannerArray;

@property (nonatomic, strong) CHSmallDayBanner *bannerView;
@property (nonatomic, strong) CHSmallDayCBDView *cbdView;

@end

@implementation ViewController

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

- (NSMutableArray *)bannerArray
{
    if (!_bannerArray) {
        _bannerArray = [[NSMutableArray alloc]init];
    }
    return _bannerArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = @[[UIImage imageNamed:@"LoginOne"],[UIImage imageNamed:@"LoginTwo"],[UIImage imageNamed:@"LoginThree"]];
    __weak typeof(self) weakSelf = self;

    if (!_bannerArray) {
        _bannerView = [CHSmallDayBanner new];
        _bannerView.x = 0;
        _bannerView.y = 60;
        [self.view addSubview:_bannerView];
    }
    
    if (!_cbdView) {
        _cbdView = [[CHSmallDayCBDView alloc]initWithFrame:CGRectMake(0, 300, CHScreenW, 450)];
        [self.view addSubview:_cbdView];
    }
    
    [[CHNetWorking sharedManager]getWithUrlString:@"http://apiv2.xiaorizi.me/index/?all=1&app_token=73DD9F5229EADB98&channel=iTunes&city=beijing&pageindex=1&shopdata_version=1&token_time=1514537015&uuid=5232B239-4C44-4739-B706-3701EADA0919&v=2&version=7.0.0" withParams:nil andBlock:^(id data, NSError *error) {
        //NSLog(@"%@",data);
        
        //CHBannerList *bannerList = [CHBannerList yy_modelWithJSON:data[@"bannerdata"]];
        NSArray *ue = [CHBannerList mj_objectArrayWithKeyValuesArray:data[@"bannerdata"]];
        NSArray *cbdArray = [CHCBDDataModel mj_objectArrayWithKeyValuesArray:data[@"cbddata"]];
        weakSelf.bannerView.curBannerList = ue;
        weakSelf.cbdView.cbdArray = cbdArray;
        [weakSelf.cbdView reloadData];

    }];
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.kkkkk.image = _imageArray[0];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    
    //self.kkkkk.image = _imageArray[0];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)changeImage {
    
    //NSLog(@"dddddd");
    
    
    //[self changeArray];

    //self.kkkkk = [UIImageView animationImages]
    
    //self.lastindex = 0;
    
    
    
   
    
    if (self.lastindex < 3) {
        
        [UIView transitionWithView:self.kkkkk duration:3.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
             self.kkkkk.image = self.imageArray[self.lastindex++];
        } completion:nil];
        
        
        
    } else {
        
        self.lastindex = 0;

        
    }
    
    
    
   
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    if (_timer != nil) {
        [_timer invalidate];
    }
}
@end
