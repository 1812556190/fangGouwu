//
//  MSGoodsDetailsController.m
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSGoodsDetailsController.h"

@interface MSGoodsDetailsController ()
@property (weak, nonatomic) IBOutlet UIView *imageTextView;
@property (weak, nonatomic) IBOutlet UILabel *goodsLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPrice;

@property (weak, nonatomic) IBOutlet UILabel *marketPrice;
@property (weak, nonatomic) IBOutlet UILabel *taxLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation MSGoodsDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setterNavigation];
}


- (void)setterNavigation{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xffffff]] forBarMetrics:UIBarMetricsDefault];
    self.title = @"商品详情";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem customItemNormalImage:@"brandDetailsBack" selectedImage:nil target:self action:@selector(leftCancelAction:)];
    
    UIBarButtonItem *right_01 = [UIBarButtonItem customItemNormalImage:@"navItemNotCollect2" selectedImage:@"navItemNotCollect" target:self action:@selector(rightLikeGoodsAction:)];
    
    UIBarButtonItem *right_02 = [UIBarButtonItem customItemNormalImage:@"navItemShare2" selectedImage:@"navItemShare" target:self action:@selector(rightShareGoodsAction:)];
    self.navigationItem.rightBarButtonItems = @[right_01,right_02];
}


#pragma mark - 导航栏按钮
- (void)rightLikeGoodsAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    
}
- (void)rightShareGoodsAction:(UIButton *)btn{
    
}
- (void)leftCancelAction:(UIButton *)btn{
    
}

@end
