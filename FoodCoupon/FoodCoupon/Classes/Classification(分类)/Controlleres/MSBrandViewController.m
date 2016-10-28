//
//  MSBrandViewController.m
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBrandViewController.h"
#import "MSBrandItemCell.h"

#import "MSBrandDetailsController.h"

@interface MSBrandViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

static NSString *ItemCell = @"CollcetionViewCell";

static NSString *ITEMID = @"MSBrandItemCell";

@implementation MSBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.collectionView];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    STATUSBarDEFAULT
    
    [self.navigationController.navigationBar setHidden:NO];
    
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        CGRect collectionViewFrame = CGRectMake(0,0, XSSREENWIDTH,XSSREENHEIGHT - 64 - 49);
        UICollectionViewFlowLayout *flowLayou = [[UICollectionViewFlowLayout alloc] init];
        flowLayou.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayou.minimumLineSpacing = 10;
        flowLayou.minimumInteritemSpacing = 0;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayou];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator  = NO;
        collectionView.showsVerticalScrollIndicator  = NO;
        
        collectionView.backgroundColor = [UIColor colorWithHex:0xf0f0f0];
        
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ItemCell];
        [collectionView registerNib:[UINib nibWithNibName:@"MSBrandItemCell" bundle:nil] forCellWithReuseIdentifier:ITEMID];
        
        _collectionView = collectionView;

    }
    return _collectionView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSLog(@"%ld",section);
    if (section == 1) {
        return 10;
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",indexPath.section);
     UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ItemCell forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UMS_account_login"]];
        UILabel *label = [[UILabel alloc] initWithFrame:cell.frame];
        label.text = @"大牌汇";
        label.textColor = [UIColor colorWithHex:0x3d2809];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:25];
        [cell.contentView addSubview:label];
        
    }else if (indexPath.section == 1){
        MSBrandItemCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:ITEMID forIndexPath:indexPath];
        return item;
    }else{
        
    }
    return cell;
}

- (void)creatLabelFrame:(CGRect)frame{
   
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(XSSREENWIDTH, 80);
    }else if (indexPath.section == 1){
        return CGSizeMake((XSSREENWIDTH - 30) / 2, 150);
    }else{
        
    }
    return CGSizeMake(100, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 1) {
        return UIEdgeInsetsMake(10,10,10,10);
    }
    return UIEdgeInsetsZero;
}

//点击事件

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        MSBrandDetailsController *detailVc = (MSBrandDetailsController *)[UIViewController storyboardWithName:@"Main" instantiateViewControllerWithIdentifier:@"MSBrandDetailsController"];
        [detailVc.navigationController.navigationBar setHidden:YES];
        
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}



@end
