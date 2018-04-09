//
//  CHSmallDayTagView.m
//  smallDay
//
//  Created by 陈欢 on 2018/1/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmallDayTagView.h"
#import "CHSmallDayTagCollectionViewCell.h"
@interface CHSmallDayTagView() <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UILabel *tabLabel;
@property (nonatomic, strong) UIButton *tabButton;
@property (nonatomic, strong) UILabel *desLable;
@property (nonatomic, strong) UICollectionView *tagCollectionView;
@property (nonatomic, strong) UIPageControl *tagPageControl;


@end
@implementation CHSmallDayTagView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor blueColor];
        [self configView];
        
    }
    return self;
}


- (void)configView
{
    if (!_tabLabel) {
        _tabLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, CHScreenW - 100, 30)];
        _tabLabel.text = @"分类";
        _tabLabel.font = [UIFont systemFontOfSize:14];
        _tabLabel.textColor = [UIColor blackColor];
        _tabLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tabLabel];
    }
    
    if (!_tabButton) {
        _tabButton = [[UIButton alloc]initWithFrame:CGRectMake(CHScreenW - 50, 0, 50, 30)];
        [_tabButton setImage:[UIImage imageNamed:@"gengduo"] forState:UIControlStateNormal];
        [_tabButton addTarget:self action:@selector(pushShow) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_tabButton];
    }
    
    if (!_desLable) {
        _desLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, CHScreenW, 20)];
        _desLable.textColor = [UIColor grayColor];
        _desLable.text = @"在街角巷尾寻找生活美好";
        _desLable.textAlignment = NSTextAlignmentCenter;
        _desLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:_desLable];
    }
    
    if (!_tagCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(CHScreenW / 3 - 10 , 100);
        //同一行相邻两个cell的最小间距
        layout.minimumInteritemSpacing = 10;
        //最小两行之间的间距
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 5, 50, 5);
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        _tagCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, CHScreenW, 320) collectionViewLayout:layout];
        _tagCollectionView.backgroundColor = [UIColor whiteColor];
        _tagCollectionView.showsVerticalScrollIndicator = NO;
        _tagCollectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_tagCollectionView];
        
        [_tagCollectionView registerClass:[CHSmallDayTagCollectionViewCell class] forCellWithReuseIdentifier:@"tag"];
        _tagCollectionView.delegate = self;
        _tagCollectionView.dataSource = self;
    }

}


- (void)reloadData
{
    [_tagCollectionView reloadData];
}

- (void)pushShow
{
    
}


//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tagArray.count;
}





- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

{
    CHSmallDayTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tag" forIndexPath:indexPath];
    //NSLog(@"%ld",(long)indexPath.row);
    //cell.backgroundColor = [UIColor redColor];
    
    
    
    //NSLog(@"%@---------------", _cbdArray);
    //NSLog(@"%@===============", _cbdArray[indexPath.row]);
    
    if (_tagArray) {
        cell.tagModel = self.tagArray[indexPath.row];
    }
    
    
    
    
    return cell;
}



















@end
