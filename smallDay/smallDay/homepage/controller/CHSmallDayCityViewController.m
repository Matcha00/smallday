//
//  CHSmallDayCityViewController.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayCityViewController.h"
#import "CHSmallDayCityCollectionViewCell.h"
#import "CHSmallDayHeaderCollectionReusableView.h"



@interface CHSmallDayCityViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *chinaCity;
@property (nonatomic, strong) NSArray *otherCity;
@property (nonatomic, strong) UICollectionView *cityCollectionView;

@end

@implementation CHSmallDayCityViewController
- (NSArray *)chinaCity
{
    if (!_chinaCity) {
        _chinaCity = [[NSArray alloc]init];
    }
    
    return _chinaCity;
}

- (NSArray *)otherCity
{
    if (!_otherCity) {
        
        _otherCity = [[NSArray alloc]init];
        
    }
    return _otherCity;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, CHScreenW, 50)];
    titleLable.text = @"选择城市";
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.userInteractionEnabled = YES;
    [self.view addSubview:titleLable];
    
    UIButton *buttonDis = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
    [buttonDis setTitle:@"取消" forState:UIControlStateNormal];
    [buttonDis setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonDis addTarget:self action:@selector(dissVc) forControlEvents:UIControlEventTouchUpInside];
    [titleLable addSubview:buttonDis];
    
    _chinaCity = @[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"成都",@"南京",@"武汉",@"西安",@"重庆",@"青岛",@"长沙",@"大连",@"厦门",@"昆明",@"沈阳",@"苏州",@"扬州",@"汕头",@"徽州",@"景德镇",@"潮州",@"天津",@"台北"];
    
    _otherCity = @[@"迪拜",@"罗马",@"伦敦",@"巴黎",@"里斯本",@"柏林"];
    
    if (!_cityCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(CHScreenW / 3 - 1 , 50);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.headerReferenceSize = CGSizeMake(CHScreenW, 50);
        _cityCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, CHScreenW, CHScreenH - 50) collectionViewLayout:layout];
        _cityCollectionView.delegate = self;
        _cityCollectionView.dataSource = self;
        _cityCollectionView.backgroundColor = [UIColor grayColor];
        [_cityCollectionView registerClass:[CHSmallDayHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"city"];
        [_cityCollectionView registerClass:[CHSmallDayCityCollectionViewCell class] forCellWithReuseIdentifier:@"citycell"];
        _cityCollectionView.alwaysBounceVertical = NO;
        [self.view addSubview:_cityCollectionView];
        //selectItemAtIndexPath
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _chinaCity.count;
    } else {
        return _otherCity.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CHSmallDayCityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"citycell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.cityName = _chinaCity[indexPath.row];
    } else {
        cell.cityName = _otherCity[indexPath.row];
    }
    
    
    return cell;
}






- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CHSmallDayHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"city" forIndexPath:indexPath];
    if (indexPath.section == 0) {
         headerView.headerTitle = @"国内城市";
    } else {
         headerView.headerTitle = @"国外城市";
    }
    
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%@",indexPath);
    
    CHSmallDayCityCollectionViewCell *cell = (CHSmallDayCityCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSString *currentCity = cell.cityName;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    [user setObject:currentCity forKey:@"Current_SelectedCity"];
    
    if ([user synchronize]) {
        //NSNotification *notification =  [NSNotification notificationWithName:@"CHange_City" object:currentCity];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CHange_City" object:currentCity];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}

- (void)dissVc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
