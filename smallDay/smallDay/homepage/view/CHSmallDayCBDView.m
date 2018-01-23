//
//  CHSmallDayCBDView.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayCBDView.h"
#import <Masonry.h>
#import "CHSmallDayCBDCollectionViewCell.h"

@interface CHSmallDayCBDView() <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UILabel *commercialLable;
@property (nonatomic, strong) UILabel *comNextLable;
@property (nonatomic, strong) UICollectionView *cbdView;
@property (nonatomic, strong) UIPageControl *cbdControl;
@property (nonatomic, strong) NSArray *test;

@end

@implementation CHSmallDayCBDView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //self.backgroundColor = [UIColor redColor];
        [self configView];
    }
    
    return self;
}

- (void)configView
{
    if (!_commercialLable) {
        _commercialLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, CHScreenW - 100, 30)];
        _commercialLable.text = @"商圈";
        _commercialLable.font = [UIFont systemFontOfSize:14];
        _commercialLable.textColor = [UIColor blackColor];
        _commercialLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_commercialLable];
    }
    
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(CHScreenW - 50, 0, 50, 30)];
        [_nextBtn setImage:[UIImage imageNamed:@"gengduo"] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(pushShow) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_nextBtn];
    }
    
    if (!_comNextLable) {
        _comNextLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, CHScreenW, 20)];
        _comNextLable.textColor = [UIColor grayColor];
        _comNextLable.text = @"小日子陪你捕捉城市惊喜";
        _comNextLable.textAlignment = NSTextAlignmentCenter;
        _comNextLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:_comNextLable];
    }
    
    if (!_cbdView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(CHScreenW * 0.5 - 10, 120);
        //同一行相邻两个cell的最小间距
        layout.minimumInteritemSpacing = 20;
        //最小两行之间的间距
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 0);
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        _cbdView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, CHScreenW, 260) collectionViewLayout:layout];
        _cbdView.backgroundColor = [UIColor whiteColor];
        _cbdView.showsVerticalScrollIndicator = false;
        _cbdView.showsHorizontalScrollIndicator = false;
        [self addSubview:_cbdView];
        
        [_cbdView registerClass:[CHSmallDayCBDCollectionViewCell class] forCellWithReuseIdentifier:@"cbd"];
        _cbdView.delegate = self;
        _cbdView.dataSource = self;
        
        
    }
    
    if (!_cbdControl) {
        _cbdControl = [[UIPageControl alloc]initWithFrame:CGRectMake(CHScreenW * 0.5 - 10, 340, 20, 20)];
        _cbdControl.numberOfPages = 2;
        _cbdControl.pageIndicatorTintColor = [UIColor redColor];
        _cbdControl.currentPage = 0;
        _cbdControl.currentPageIndicatorTintColor = [UIColor blueColor];
        [self addSubview:_cbdControl];
        
    }
}




- (void)pushShow
{
    NSLog(@"pushShow");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = (NSInteger) (scrollView.contentOffset.x / scrollView.width ) % 3;
    
    
    
    NSLog(@"%f------------", scrollView.contentOffset.x);
    NSLog(@"%f=============", scrollView.width);
    
    _cbdControl.currentPage = page;
}

/*- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return  1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
*/
//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}





- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

{
    CHSmallDayCBDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cbd" forIndexPath:indexPath];
    //NSLog(@"%ld",(long)indexPath.row);
    //cell.backgroundColor = [UIColor redColor];
    
    
    
    //NSLog(@"%@---------------", _cbdArray);
    //NSLog(@"%@===============", _cbdArray[indexPath.row]);
    
    if (_cbdArray) {
        cell.cbdModel = self.cbdArray[indexPath.row];
    }
    
    
    
    
    return cell;
}





- (void)reloadData
{
    [_cbdView reloadData];
}








@end
