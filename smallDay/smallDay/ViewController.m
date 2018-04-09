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
#import "CHTestTag.h"
#import "CHSmallShopModel.h"
#import "CHSmallDayTagView.h"
#import "CHSmallDayLoading.h"
#import <WebKit/WebKit.h>
#import <UIImageView+WebCache.h>
#import "ChsmalldayshopmodelModel.h"
#import "CHSmalldayShowAllView.h"
#import "ChsmalldayshowusermodelModel.h"
#import "CHSmallDayRe.h"
#import "ChsmalldayreshopmodelModel.h"



@interface ViewController () <UIWebViewDelegate,UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *kkkkk;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) NSArray *imageArray;

@property (nonatomic, assign) NSInteger lastindex;

@property (nonatomic, assign) NSInteger currentindex;

@property (nonatomic, copy) NSMutableArray *bannerArray;

@property (nonatomic, strong) CHSmallDayBanner *bannerView;
@property (nonatomic, strong) CHSmallDayCBDView *cbdView;
@property (nonatomic, strong) CHSmallDayTagView *tagView;

@property (nonatomic, strong) UIWebView *web;
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UIImageView *headerImage;
@property (nonatomic, strong) UIScrollView *src;
@property (nonatomic, strong) UIView *barView;
@property (nonatomic, strong) CHSmalldayShowAllView *allView;
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
    //self.view.backgroundColor = [UIColor redColor];
    //[CHSmallDayLoading showInView:self.view];
    
    [[CHNetWorking sharedManager]getWithUrlString:@"http://apiv2.xiaorizi.me/shop/detail/?all=1&app_token=B3868EDE00863D2E&channel=iTunes&shop_id=200183&token_time=1517638120&user_id=205143&uuid=5232B239-4C44-4739-B706-3701EADA0919&version=7.0.4" withParams:nil andBlock:^(id data, NSError *error) {
        
        //NSLog(@"%@", data[@"recommendshop"]);
        
        ChsmalldayshopmodelModel *shop = [ChsmalldayshopmodelModel mj_objectWithKeyValues:data[@"data"]];
        
        NSArray *hhh = [ChsmalldayshowusermodelModel mj_objectArrayWithKeyValuesArray:data[@"useravatar"]];
        NSArray *re = [CHSmallDayRe mj_objectArrayWithKeyValuesArray:data[@"recommendshop"]];
        
        NSArray *showRe = re[0];
        self.allView.userArray = hhh;
        [self.allView reloadAll];
        
        NSLog(@"%@", shop);
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (!_allView) {
        _allView = [[CHSmalldayShowAllView alloc]initWithFrame:CGRectMake(0, 50, CHScreenW, 300)];
        _allView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_allView];
    }
    
}

    
    
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"contentOffset"])
//        
//    {
//        
//        CGFloat offsetY = self.web.scrollView.contentOffset.y;
//        
//        //self.navView.alpha = 1 + (offsetY + 200) / 136;
//        //self.headerImage.height = 300;
//        
//            if ( offsetY>=-250 && offsetY<=-186) {
//                self.navView.alpha =   (250 + offsetY) / 64 ;
//                //NSLog(@"%f",self.navView.alpha);
//            }
//        
//        if (offsetY < -250) {
//            //CGRect rect = self.headerImage.frame;
//            _headerImage.y =  offsetY;
//            _headerImage.height = -offsetY;
//            ///self.headerImage.frame = rect;
//        }
//        
//        
//       
//            
//       
//        
//    }
//}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    
//    NSLog(@"--");
//    
//    CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"%f",offsetY);
////    if (offsetY>-250) {
////
////    } else {
////
////    }
//    
//    
//    static float newx = 0;
//    static float oldx = 0;
//    newx= scrollView.contentOffset.y ;
//    if (newx != oldx ) {
//        //Left-YES,Right-NO
//        if (newx > oldx && decelerate ) {
//            //self.scrollLeftOrRight = NO;
//            NSLog(@"up");
//            [UIView animateWithDuration:1 animations:^{
//                self.barView.y = CHScreenH - 60;
//
//            }];
//                    }else if(newx < oldx && decelerate ){
//           // self.scrollLeftOrRight = ES;
//            NSLog(@"down");
//            [UIView animateWithDuration:1 animations:^{
//                self.barView.y = CHScreenH;
//
//            }];
//            
//            }
//        oldx = newx;
//    }
//
//    
//    
//}
//
//
//
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    NSLog(@"%f",webView.scrollView.contentSize.height);
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, webView.scrollView.contentSize.height, CHScreenW, 100)];
//    view.backgroundColor = [UIColor blueColor];
//    [webView.scrollView addSubview:view];
//    NSLog(@"???????");
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;   //状态栏字体白色 UIStatusBarStyleDefault黑色
}

- (void)dealloc {
    
    if (_timer != nil) {
        [_timer invalidate];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}
@end
    /*
    NSString *string = @"<head><style>img{width:100% !important;}img{height:auto !important;}</style></head><body><p>TRIBE\u662f\u4e00\u5bb6\u6709\u673a\u9910\u5385\u3002\u5750\u843d\u5728\u5317\u4eac\u5de5\u4f53\u9644\u8fd1\uff0c\u4f5c\u4e3a\u4e00\u5bb6\u5c61\u6b21\u83b7\u5956\u7684\u6709\u673a\u9910\u5385,\u79c9\u6301\u7740\u201cYou are what you eat, drink and breathe\u201d\u7684\u53e3\u53f7\uff0c\u5c06\u6709\u673a\u5065\u5eb7\u7684\u7406\u5ff5\u5e26\u7ed9\u4e86\u4f17\u591a\u98df\u5ba2\u3002</p><p><img height=\"739\" src=\"http://pic.huodongjia.com/event/2015-08-22/event135573.jpg\" width=\"1004\"></img></p><p>\u4ee5\u6709\u673a\u3001\u5065\u5eb7\u548c\u5145\u6ee1\u521b\u610f\u4e3a\u5b9a\u4f4d\uff0cTRIBE\u4e0e\u4e1a\u5185\u6700\u597d\u7684\u6709\u673a\u4f9b\u5e94\u5546\u4eec\u5408\u4f5c\uff0c\u4ece\u852c\u83dc\uff0c\u6c34\u679c\uff0c\u6742\u7cae\uff0c\u725b\u5976\uff0c\u8089\u7c7b\uff0c\u5230\u5496\u5561\u8c46\uff0c\u8336\u53f6\uff0c\u8702\u871c\uff0c\u9152\u996e\u7b49\uff0c\u4ed6\u4eec\u6bcf\u5929\u91c7\u8d2d\u6709\u673a\u7684\u98df\u6750\uff0c\u8ba9\u6d88\u8d39\u8005\u5403\u5230\u6700\u5b89\u5168\u548c\u65b0\u9c9c\u7684\u98df\u7269\u3002</p><p><img height=\"676\" src=\"http://pic.huodongjia.com/event/2015-08-22/event135574.jpg\" width=\"1008\"></img></p><p>\u8425\u517b\uff0c\u7f8e\u5473\u7684\u6709\u673a\u996e\u98df\uff0c\u5404\u79cd\u4e30\u5bcc\u7684\u897f\u9910\u548c\u4e9a\u6d32\u53e3\u5473\u878d\u5408\uff0c\u91c7\u7528\u6700\u5065\u5eb7\u7684\u65b9\u5f0f\u70f9\u996a\u662fTRIBE\u83dc\u54c1\u7684\u7279\u8272\u3002\u800c\u4e14TRIBE\u7684\u6c99\u62c9\uff0c\u8c37\u7269\u996d\uff0c\u548c\u70d8\u7119\u98df\u54c1\u7b49\u90fd\u63d0\u4f9b\u7d20\u98df\uff0c\u4e25\u683c\u7d20\u98df\uff0c\u65e0\u9eb8\u8d28\u7b49\u7279\u522b\u7684\u9009\u62e9\u3002\u00a0</p><p>\u66f4\u91cd\u8981\u7684\u662f\uff0cTRIBE\u4e0d\u4ec5\u4ec5\u53ea\u662f\u9910\u996e\u63d0\u4f9b\u8005\uff0c\u66f4\u662f\u5021\u5bfc\u5065\u5eb7\u751f\u6d3b\u65b9\u5f0f\u7684\u54c1\u724c\uff1b\u5373\u6b63\u786e\u7684\u996e\u98df\u3001\u4fdd\u6301\u5065\u5eb7\u8eab\u578b\u548c\u6ce8\u91cd\u4f60\u7684\u751f\u6d3b\u73af\u5883\u3001\u70ed\u7231\u4f60\u7684\u793e\u533a\u4e00\u6837\u91cd\u8981\u3002</p><p><img height=\"674\" src=\"http://pic.huodongjia.com/event/2015-08-22/event135571.jpg\" width=\"1007\"></img></p><p>TRIBE\u7684\u521b\u59cb\u4ebaYvonne\u8fc7\u53bb\u4e00\u76f4\u5728\u54c1\u724c\u8bbe\u8ba1\u9886\u57df\u5de5\u4f5c\u3002\u7531\u4e8e\u884c\u4e1a\u7279\u70b9\u7684\u539f\u56e0\uff0c\u751f\u6d3b\u65b9\u5f0f\u5f88\u4e0d\u5065\u5eb7\u3002\u5979\u70ed\u7231\u8fd0\u52a8\u548c\u5065\u5eb7\u7684\u751f\u6d3b\u65b9\u5f0f\uff0c\u4e5f\u7231\u65c5\u884c\u548c\u7f8e\u98df\uff0c\u6240\u4ee5\u68a6\u60f3\u6709\u4e00\u5929\u53ef\u4ee5\u5c06\u4e16\u754c\u5404\u5730\u7684\u7f8e\u98df\u548c\u5065\u5eb7\u73af\u4fdd\u7684\u751f\u6d3b\u65b9\u5f0f\u7ed3\u5408\u8d77\u6765\u3002</p><p>\u5f53\u5927\u5bb6\u90fd\u9003\u79bb\u5317\u4eac\u8fd9\u4e2a\u88ab\u8ba4\u4e3a\u662f\u5f88\u4e0d\u5065\u5eb7\u7684\u57ce\u5e02\u91cc\u7684\u65f6\u5019\uff0c\u5979\u51b3\u5b9a\u8f9e\u804c\u5e76\u4e14\u8bf4\u670d\u597d\u670b\u53cbQueenie\u548c\u5176\u4ed6\u7684\u6295\u8d44\u8005\u4e00\u8d77\u5f00\u4e86TRIBE\uff0c\u5e76\u4e14\u5168\u804c\u6765\u7ecf\u8425\u3002TRIBE\u4ece\u7b56\u5212\u5230\u5f00\u7528\u4e86\u4e00\u5e74\u7684\u65f6\u95f4\u3002\u4ece\u6982\u5ff5\u5230\u5b9e\u65bd\u7ecf\u5386\u5f88\u591a\u5b66\u4e60\u548c\u53cd\u590d\u7684\u8fc7\u7a0b\u3002</p><p><img height=\"1126\" src=\"http://pic.huodongjia.com/event/2015-08-22/event135576.jpg\" width=\"750\"></img></p><p>\u6709\u5e78\u7684\u662f\u5979\u4eec\u627e\u5230\u4e86Brandon\uff0c\u4e00\u540d\u6765\u81ea\u7f8e\u56fd\u4e5f\u8eab\u6000\u5f00\u5065\u5eb7\u9910\u5385\u68a6\u60f3\u7684\u53a8\u5e08\uff0c\u4ed6\u5c06\u8fd9\u4e2a\u5065\u5eb7\u6709\u673a\u521b\u610f\u9910\u996e\u6982\u5ff5\u5728\u98df\u7269\u4e0a\u53d1\u6325\u5230\u6dcb\u6f13\u5c3d\u81f4\u3002\u4ed6\u4eec\u63d0\u524d\u534a\u5e74\u5c31\u5728\u4e00\u4e2a\u4e13\u95e8\u79df\u6765\u505a\u7814\u53d1\u7684\u53a8\u623f\u91cc\u5f00\u59cb\u8bd5\u9a8c\u83dc\u54c1\uff0c\u4e00\u8fb9\u8bd5\u83dc\uff0c\u4e00\u8fb9\u5404\u5904\u54c1\u5c1d\u5404\u79cd\u98ce\u5473\u7f8e\u98df\uff0c\u60f3\u5c3d\u5404\u79cd\u529e\u6cd5\u5c06\u5404\u79cd\u7f8e\u98df\u901a\u8fc7\u6709\u673a\u7684\u98df\u6750\u548c\u5065\u5eb7\u70f9\u996a\u65b9\u6cd5\u6539\u826f\u53d8\u5f97\u8d85\u7ea7\u8425\u517b\uff0c\u800c\u4e14\u7f8e\u5473\u751a\u81f3\u66f4\u7f8e\u5473\u3002</p><p><img height=\"1620\" src=\"http://pic.huodongjia.com/event/2015-08-24/event135586.JPG\" width=\"1080\"></img></p><p>Tribe\u7684\u70f9\u8c03\u65b9\u6cd5\u5341\u5206\u5065\u5eb7\uff0c\u4ed6\u4eec\u4e0d\u4f7f\u7528\u4efb\u4f55\u6dfb\u52a0\u5242\u548c\u8c03\u5473\u5242\uff0c\u4f7f\u7528\u5c11\u6cb9\u70b8\u548c\u714e\u7684\u70f9\u996a\u65b9\u5f0f\uff0c\u5982\u70d8\u70e4\uff0c\u6216\u5feb\u901f\u5730\u712f\u852c\u83dc\u6765\u5c3d\u53ef\u80fd\u591a\u5730\u4fdd\u7559\u8425\u517b\u3002</p><p>\u4ed6\u4eec\u4f7f\u7528\u5355\u4e0d\u9971\u548c\u8102\u80aa\u548c\u591a\u9971\u548c\u8102\u80aa\uff0c\u6bd4\u5982\u8475\u82b1\u7c7d\u6cb9\u3001\u6a44\u6984\u6cb9\u4ee5\u53ca\u6930\u5b50\u6cb9\uff0c\u51cf\u5c11\u9971\u548c\u8102\u80aa\u4ee5\u53ca\u675c\u7edd\u53cd\u5f0f\u8102\u80aa\u3002\u53e6\u5916\u6240\u6709\u7cbe\u5236\u7cd6\u90fd\u4e0d\u4f1a\u51fa\u73b0\u5728Tribe\u7684\u53a8\u623f\u91cc\uff0c\u6240\u6709\u7684\u767d\u7cd6\u7531\u81ea\u7136\u8c03\u6599\u4ee3\u66ff\uff0c\u5982\u8702\u871c\u3001\u9f99\u820c\u5170\u871c\u4ee5\u53ca\u679c\u6d46\u3002</p><p><img height=\"671\" src=\"http://pic.huodongjia.com/event/2015-08-22/event135575.jpg\" width=\"1005\"></img></p><p>\u5e97\u91cc\u4e0d\u4ec5\u63d0\u4f9b\u53ef\u53e3\u7684\u98df\u7269\uff0c\u8fd8\u6709\u7740\u8212\u9002\u7684\u7528\u9910\u73af\u5883\uff1a\u7b80\u7ea6\u7cbe\u81f4\u7684\u88c5\u6f62\uff0c\u4e09\u53f0\u7a7a\u6c14\u51c0\u5316\u5668\uff0c\u6728\u8d28\u684c\u6905\uff0c\u7b80\u5355\u7684\u9910\u5177\uff0c\u5230\u5904\u90fd\u80fd\u770b\u5230\u7684\u690d\u7269\u3002\u6253\u5305\u76d2\u4e5f\u90fd\u662f\u7eb8\u8d28\uff0c\u8fd9\u4e9b\u90fd\u900f\u9732\u51faTribe\u6240\u5021\u5bfc\u7684\u73af\u4fdd\u7406\u5ff5\u3002</p><p>\u73b0\u5728TRIBE\u4e0d\u4ec5\u662f\u5065\u5eb7\u996e\u98df\u7231\u597d\u8005\u70ed\u7231\u7684\u9910\u5385\uff0c\u66f4\u662f\u6709\u673a\u548c\u5065\u5eb7\u751f\u6d3b\u7684\u5927\u90e8\u843d\u3002</p><p><img height=\"810\" src=\"http://pic.huodongjia.com/event/2015-08-22/event135577.jpg\" width=\"1080\"></img></p><p>\u6bcf\u5468\u90fd\u6709\u7684\u6709\u673a\u852c\u679c\u96c6\u5e02\u4e5f\u662fTRIBE\u7684\u53c8\u4e00\u4eae\u70b9\u3002</p><p><img height=\"1080\" src=\"http://pic.huodongjia.com/event/2015-08-24/event135585.jpg\" width=\"1080\"></img></p><p>\u56fe\u7247\u6e90\u4e8e\u7f51\u7edc</p></body>";
    
    
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.src = web.scrollView;
    web.delegate = self;
    self.src.contentInset = UIEdgeInsetsMake(250, 0, 100, 0);
    self.src.contentOffset = CGPointMake(0, -250);
    self.src.delegate = self;
    //src.contentSize = CGSizeMake(CHScreenW, src.contentSize.height + 300);
    //web.scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    [web loadHTMLString:string baseURL:nil];
    [self.view addSubview:web];
    self.web = web;
    
    [web.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:@"hhhhh"];
    
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, -250, CHScreenW, 200)];
        [_headerImage sd_setImageWithURL:[NSURL URLWithString:@"http://pic.huodongjia.com/event/2015-08-01/event133180.jpg"]];
        //_headerImage.backgroundColor = [UIColor redColor];
        _headerImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.web.scrollView addSubview:_headerImage];
    }
    
    if (!_navView) {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CHScreenW, 64)];
        _navView.backgroundColor = [UIColor yellowColor];
        _navView.alpha = 0;
        [self.view addSubview:_navView];
    }
    
    if (!_barView) {
        _barView = [[UIView alloc]initWithFrame:CGRectMake(0, CHScreenH - 60, CHScreenW, 60)];
        _barView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_barView];
    }
    
    
    //-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
    //    {
    //
    //    }
    
    
    
    //_imageArray = @[[UIImage imageNamed:@"LoginOne"],[UIImage imageNamed:@"LoginTwo"],[UIImage imageNamed:@"LoginThree"]];
    // __weak typeof(self) weakSelf = self;
    
    //    if (!_bannerArray) {
    //        _bannerView = [CHSmallDayBanner new];
    //        _bannerView.x = 0;
    //        _bannerView.y = 60;
    //        [self.view addSubview:_bannerView];
    //    }
    //
    //    if (!_tagView) {
    //        _tagView = [[CHSmallDayTagView alloc]initWithFrame:CGRectMake(200, 100, CHScreenW, 380)];
    //        [self.view addSubview:_tagView];
    //    }
    
    
    
    
    //    [[CHNetWorking sharedManager]getWithUrlString:@"http://apiv2.xiaorizi.me/index/?all=1&app_token=73DD9F5229EADB98&channel=iTunes&city=beijing&pageindex=1&shopdata_version=1&token_time=1514537015&uuid=5232B239-4C44-4739-B706-3701EADA0919&v=2&version=7.0.0" withParams:nil andBlock:^(id data, NSError *error) {
    //        //NSLog(@"%@",data);
    //
    //        //CHBannerList *bannerList = [CHBannerList yy_modelWithJSON:data[@"bannerdata"]];
    //        NSArray *bannerArray = [CHBannerList mj_objectArrayWithKeyValuesArray:data[@"bannerdata"]];
    //        NSArray *cbdArray = [CHCBDDataModel mj_objectArrayWithKeyValuesArray:data[@"cbddata"]];
    //        NSArray *tagArray = [CHTagDataModel mj_objectArrayWithKeyValuesArray:data[@"tagdata"]];
    //
    //
    //        //NSArray *te = [CHShopDataModel yy_modelWithDictionary:data[@"shopdata"]];
    //
    //
    //       CHSmallDayShopModel *hhhhh = [CHSmallDayShopModel mj_objectWithKeyValues:data[@"shopdata"]];
    //       //MJStatusResult *result = [MJStatusResult mj_objectWithKeyValues:dic];
    //
    //
    //        NSArray *wode = hhhhh.current_objects;
    //
    //        NSLog(@"%@", hhhhh);
    //
    //
    //        weakSelf.bannerView.curBannerList = bannerArray;
    //        weakSelf.tagView.tagArray = tagArray;
    //        [weakSelf.tagView reloadData];
    //
    //    }];
    //
    
    
    
    //    self.view.backgroundColor = [UIColor whiteColor];
    //
    //
    //    self.kkkkk.image = _imageArray[0];
    //
    //    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    
    //self.kkkkk.image = _imageArray[0];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//- (void)changeImage {
//
//    //NSLog(@"dddddd");
//
//
//    //[self changeArray];
//
//    //self.kkkkk = [UIImageView animationImages]
//
//    //self.lastindex = 0;
//
//
//
//
//
//    if (self.lastindex < 3) {
//
//        [UIView transitionWithView:self.kkkkk duration:3.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//             self.kkkkk.image = self.imageArray[self.lastindex++];
//        } completion:nil];
//        
//        
//        
//    } else {
//        
//        self.lastindex = 0;
//
//        
//    }
//    
//    
//    
//   
//    
//    
//}
//
//
*/
