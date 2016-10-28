//
//  MSTableFooter.m
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTableFooter.h"
#import "MSFooterCell.h"

#define SectionMargin 5

@interface MSTableFooter ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,MSFooterCellDelegate>{
    CGFloat _itemH;
}

@end

static NSString *ItemCell = @"MSFooterCell";

@implementation MSTableFooter



- (instancetype)initWithCustomCollectionView
{
    UICollectionViewFlowLayout *flowLayou = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemW = (XSSREENWIDTH - 5) / 2;
    _itemH = itemW + 50;
    flowLayou.itemSize = CGSizeMake(itemW,_itemH);
    flowLayou.scrollDirection = UICollectionViewScrollDirectionHorizontal;//设置滚动方向
    flowLayou.minimumLineSpacing = SectionMargin;
    flowLayou.minimumInteritemSpacing = 5;
    flowLayou.sectionInset = UIEdgeInsetsMake(0, 0,0, 0);
    flowLayou.scrollDirection = UICollectionViewScrollDirectionVertical;
    self = [self initWithFrame:CGRectMake(0, 0, XSSREENWIDTH,100) collectionViewLayout:flowLayou];
    
    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator  = NO;
    self.showsVerticalScrollIndicator  = NO;
    self.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
    
    self.scrollEnabled = NO;
    
    [self registerNib:[UINib nibWithNibName:@"MSFooterCell" bundle:nil] forCellWithReuseIdentifier:ItemCell];
    
    return self;
    
}


- (void)cellLoadHeight{
    
    self.height = 5 * _itemH + SectionMargin * 4 + 80;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MSFooterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ItemCell forIndexPath:indexPath];
    cell.footerDelegate = self;
    
  return  cell;
}


#pragma mark - MSFooterCellDelegate
- (void)didSelectAddCartBtn:(UIButton *)btn{
    NSLog(@"加入购物车!");
}

@end
