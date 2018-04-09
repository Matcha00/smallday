//
//  CHSmalldayShowView.m
//  smallDay
//
//  Created by 陈欢 on 2018/2/5.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHSmalldayShowAllView.h"
#import "CHSmallDayShowUserCollectionViewCell.h"
@interface CHSmalldayShowAllView() <UICollectionViewDelegate, UICollectionViewDataSource>


@property (nonatomic, strong) UIImageView *xinImage;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UIButton *allButton;
@property (nonatomic, strong) UICollectionView *user;



@end
@implementation CHSmalldayShowAllView

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
        [self configView];
    }
    return self;
}

- (void)configView
{
    if (!_xinImage) {
        _xinImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 17, 17)];
        _xinImage.image = [UIImage imageNamed:@"elike"];
        [self addSubview:_xinImage];
    }
    
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 20)];
        _amountLabel.textAlignment = NSTextAlignmentLeft;
        _amountLabel.font = [UIFont systemFontOfSize:13];
        _amountLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_amountLabel];
    }
    
    if (!_allButton) {
        _allButton = [[UIButton alloc]initWithFrame:CGRectMake(CHScreenW - 50, 10, 50, 20)];
        [_allButton addTarget:self action:@selector(allShow) forControlEvents:UIControlEventTouchUpInside];
        [_allButton setTitle:@"全部" forState:UIControlStateNormal];
        [self addSubview:_allButton];
    }
    
    if (!_user) {
       
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        NSInteger width = (CHScreenW -20) / 7;
        NSLog(@"--------------%ld", (long)width);
        layout.itemSize = CGSizeMake(50, 40);
        //同一行相邻两个cell的最小间距
        layout.minimumInteritemSpacing = 20;
        //最小两行之间的间距
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _user = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 35, CHScreenW, 60)collectionViewLayout:layout];
        _user.backgroundColor = [UIColor whiteColor];
        [_user registerClass:[CHSmallDayShowUserCollectionViewCell class] forCellWithReuseIdentifier:@"showcell"];
        _user.scrollEnabled = NO;
        _user.delegate = self;
        _user.dataSource = self;
        [self addSubview:_user];
    }
}
- (void)allShow
{
    NSLog(@"----");
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    if (indexPath.row == 6) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showcell" forIndexPath:indexPath];
        return cell;
    }

    CHSmallDayShowUserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showcell" forIndexPath:indexPath];
    cell.shop = self.userArray[indexPath.row];
       return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 6) {
        [self allShow];
    }
    NSLog(@"---+++");
}

- (void)reloadAll
{
    [_user reloadData];
}

@end
