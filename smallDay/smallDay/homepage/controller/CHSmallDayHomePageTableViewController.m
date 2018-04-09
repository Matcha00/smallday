//
//  CHSmallDayHomePageTableViewController.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayHomePageTableViewController.h"
#import "CHSmallDayCityViewController.h"
#import "CHNetWorking.h"
#import "CHSmallDayHomePageTableViewCell.h"
#import "CHSmallShopModel.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import "CHSmallDayReFresh.h"
#import "CHSmallDayBanner.h"
#import "CHSmallDayCBDView.h"
#import "CHSmallDayTagView.h"
#import "HomePageModel.h"
#import "CHBannerList.h"
#import "CHSmallDayCellHeader.h"
#import "CHSmallDayFourButtonView.h"
#import "CHSmallDayShowShopView.h"
#import <Masonry.h>

@interface CHSmallDayHomePageTableViewController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) CHSmallDayBanner *bannerView;
@property (nonatomic, strong) CHSmallDayCBDView *cbdView;
@property (nonatomic, strong) CHSmallDayTagView *tagView;
@property (nonatomic, strong) CHSmallDayCellHeader *cellHeader;
@property (nonatomic, strong) CHSmallDayFourButtonView *fourView;
@end

@implementation CHSmallDayHomePageTableViewController

static NSString * const CHHomeCellId = @"home";

- (NSMutableArray *)cellArray
{
    if (!_cellArray) {
        _cellArray = [[NSMutableArray alloc]init];
    }
    
    return _cellArray;
}

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
    }
    return _headerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 80, 44)];
    [_btn setImage:[UIImage imageNamed:@"dingwei"] forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_btn addTarget:self action:@selector(pushVc) forControlEvents:UIControlEventTouchUpInside];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    NSString *currentCity = [user objectForKey:@"Current_SelectedCity"];
    
    if (currentCity) {
        [_btn setTitle:currentCity forState:UIControlStateNormal];
    } else {
        [_btn setTitle:@"北京" forState:UIControlStateNormal];

    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageCity:) name:@"CHange_City" object:nil];
    
    //self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigation_1" highImage:@"navigation_1" target:self action:@selector(pushVc)];
    
    
    [self settingTableView];
    [self setRefreshTableView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_btn];
    
    [self settingHeaderView];
    
    
}

- (void)settingHeaderView
{
    self.headerView.frame = CGRectMake(0, 0, CHScreenW, 1150);
    //self.headerView.backgroundColor = [UIColor blueColor];
    CHweakSelf;
    self.tableView.tableHeaderView = self.headerView;
    //self.tableView.tableHeaderView.backgroundColor = [UIColor redColor];
    if (!_bannerView) {
        _bannerView = [[CHSmallDayBanner alloc]init];
        [self.headerView addSubview:_bannerView];
        [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(weakSelf.headerView.mas_top).offset(0);
            make.left.mas_equalTo(weakSelf.headerView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(CHScreenW, 200));
            
        }];
        
        
    }
   
    if (!_fourView) {
        _fourView = [[CHSmallDayFourButtonView alloc]init];
        //_fourView.backgroundColor = [UIColor grayColor];
        [self.headerView addSubview:_fourView];
        [self.fourView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.bannerView.mas_bottom).offset(0);
            make.left.mas_equalTo(weakSelf.headerView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(CHScreenW, 100));
        }];
        
    }
    
    if (!_cbdView) {
        _cbdView = [[CHSmallDayCBDView alloc]init];
        [self.headerView addSubview:_cbdView];
        
        [self.cbdView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(weakSelf.fourView.mas_bottom).offset(0);
            make.left.mas_equalTo(weakSelf.headerView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(CHScreenW, 400));
            
        }];
    }
    
    if (!_tagView) {
        _tagView = [[CHSmallDayTagView alloc]init];
        [self.headerView addSubview:_tagView];
        [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(weakSelf.cbdView.mas_bottom).offset(0);
            make.left.mas_equalTo(weakSelf.headerView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(CHScreenW, 380));
            
            
        }];
    }
    
    if (!_cellHeader) {
        _cellHeader = [[CHSmallDayCellHeader alloc]initWithFrame:CGRectMake(0, 1200, CHScreenW, 40)];
        [self.headerView addSubview:_cellHeader];
        [self.cellHeader mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(weakSelf.tagView.mas_bottom).offset(20);
            make.left.mas_equalTo(weakSelf.headerView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(CHScreenW, 40));
            
        }];
    }
}

- (void)settingTableView
{
    
    CGFloat bottom = self.tabBarController.tabBar.height;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, bottom, 0);

     self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[CHSmallDayHomePageTableViewCell class] forCellReuseIdentifier:CHHomeCellId];
    
    
   
}

- (void)setRefreshTableView
{
    self.tableView.mj_header = [CHSmallDayReFresh headerWithRefreshingTarget:self refreshingAction:@selector(loadnewMessage)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    [self.tableView.mj_header beginRefreshing];

    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMessage)];
    
    
}

- (void)messageCity:(NSNotification *)notification
{
    NSString *currentCity = notification.object;
    
    if (currentCity) {
        [_btn setTitle:currentCity forState:UIControlStateNormal];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushVc
{
    CHSmallDayCityViewController *vc = [[CHSmallDayCityViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)loadnewMessage
{
    
    CHweakSelf;
    [self.tableView.mj_footer endRefreshing];
    
    
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         
         [[CHNetWorking sharedManager]getWithUrlString:@"http://apiv2.xiaorizi.me/index/?all=1&app_token=73DD9F5229EADB98&channel=iTunes&city=beijing&pageindex=1&shopdata_version=1&token_time=1514537015&uuid=5232B239-4C44-4739-B706-3701EADA0919&v=2&version=7.0.0" withParams:nil andBlock:^(id data, NSError *error) {
             
             NSArray *bannerArray = [CHBannerList mj_objectArrayWithKeyValuesArray:data[@"bannerdata"]];
             NSArray *cbdArray = [CHCBDDataModel mj_objectArrayWithKeyValuesArray:data[@"cbddata"]];
             NSArray *tagArray = [CHTagDataModel mj_objectArrayWithKeyValuesArray:data[@"tagdata"]];
             weakSelf.cbdView.cbdArray = cbdArray;
             //[weakSelf.cbdView reloadData];
            
             weakSelf.bannerView.curBannerList = bannerArray;
             weakSelf.tagView.tagArray = tagArray;
             
             
             
             
             CHSmallDayShopModel *shopModel  = [CHSmallDayShopModel mj_objectWithKeyValues:data[@"shopdata"]];
             
             NSArray *newArray = shopModel.current_objects;
             
             [self.cellArray addObjectsFromArray:newArray];
             
             
             
             [self.tableView.mj_header endRefreshing];
             
             self.page = 1;
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [self.tableView reloadData];
                 [weakSelf.tagView reloadData];
                 weakSelf.cbdView.reloadDataBlock = ^{
                     
                 };
                 
             });
             
             if (error) {
                 [self.tableView.mj_header endRefreshing];
             }
         }];
         
       

         
     });
    
   }

- (void)loadMoreMessage
{
    
    [self.tableView.mj_header endRefreshing];
    
    self.page++;
    
    
    NSString *urlOne = @"http://apiv2.xiaorizi.me/index/?all=1&app_token=73DD9F5229EADB98&channel=iTunes&city=beijing&pageindex=";
    NSString *urlTwo = [NSString stringWithFormat:@"%ld",(long)self.page];
    
    NSString *urlThree = @"&shopdata_version=1&token_time=1514537015&uuid=5232B239-4C44-4739-B706-3701EADA0919&v=2&version=7.0.0";
    
    NSString *urlFour = [urlOne stringByAppendingString:urlTwo];
    
    NSString *moreUrl = [urlFour stringByAppendingString:urlThree];
    
    NSLog(@"%@,%ld", moreUrl, self.page);
    
    
   
    [[CHNetWorking sharedManager] getWithUrlString:moreUrl withParams:nil andBlock:^(id data, NSError *error) {
        
        CHSmallDayShopModel *shopModel  = [CHSmallDayShopModel mj_objectWithKeyValues:data[@"shopdata"]];
        
        NSArray *moreArray = shopModel.current_objects;
        
        
            
        [self.cellArray addObjectsFromArray:moreArray];
        NSLog(@"----------------------%@", self.cellArray);
        [self.tableView reloadData];
        
        
       
        [self.tableView.mj_footer endRefreshing];
            
            
        
        
        if (error) {
            self.page --;
            
            [self.tableView.mj_footer endRefreshing];
        }
        
    }];
    
        
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    self.tableView.mj_footer.hidden = (self.cellArray.count == 0);
   // NSLog(@"======================%lu",(unsigned long)self.cellArray.count);
    return self.cellArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    CHweakSelf;
    CHSmallDayHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CHHomeCellId forIndexPath:indexPath];
   
    cell.shopModel = self.cellArray[indexPath.row];
    
    cell.btnLikeClick = ^{
        //[weakSelf.tableView reloadData];
        NSLog(@"%@", indexPath);
        
        //[weakSelf.tableView reloadRowsAtIndexPaths:[indexPath.row withRowAnimation:UITableViewRowAnimationAutomatic ];
    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------");
    CHSmallDayShowShopView *showVC = [[CHSmallDayShowShopView alloc]init];
    [self.navigationController pushViewController:showVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CHScreenW - 50;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 130;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
