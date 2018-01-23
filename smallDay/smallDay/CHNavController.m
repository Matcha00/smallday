//
//  CHNavController.m
//  smallDay
//
//  Created by 陈欢 on 2017/12/29.
//  Copyright © 2017年 陈欢. All rights reserved.
//

#import "CHNavController.h"

@interface CHNavController ()
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation CHNavController

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"fanhuiWhite"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateSelected];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    return _backBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0) {
       
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    
    
    
    
    [super pushViewController:viewController animated:animated];
}




- (void)backBtnClick
{
    [self popViewControllerAnimated:YES];
}


@end
