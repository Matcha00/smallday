//
//  CHTabBarViewController.m
//  smallDay
//
//  Created by 陈欢 on 2017/12/29.
//  Copyright © 2017年 陈欢. All rights reserved.
//

#import "CHTabBarViewController.h"
#import "CHNavController.h"
#import "ViewController.h"
#import "CHSmallDayHomePageTableViewController.h"

@interface CHTabBarViewController ()

@end

@implementation CHTabBarViewController

+ (void)initialize
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupChildVc:[[CHSmallDayHomePageTableViewController alloc]init] title:@"小日子" image:@"wei-shouye" selectedImage:@"shouye"];
    [self setupChildVc:[[ViewController alloc]init] title:@"民宿" image:@"minsutabs" selectedImage:@"minsutab"];
    [self setupChildVc:[[ViewController alloc]init] title:@"榜单" image:@"wei-bangdan2" selectedImage:@"bangdan"];
    [self setupChildVc:[[ViewController alloc]init] title:@"我" image:@"wei-wode" selectedImage:@"wode"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    CHNavController *nav = [[CHNavController alloc]initWithRootViewController:vc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    [self addChildViewController:nav];
}

@end
