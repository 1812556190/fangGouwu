//
//  MSTabBarController.m
//  FoodCoupon
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTabBarController.h"
#import "MSNaviController.h"


@interface MSTabBarController ()

@end

@implementation MSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setterTabBar];//设置tabBar

}


- (void)setterTabBar{
    
    self.tabBar.tintColor = [UIColor colorR:215 withG:48 withB:32 Alpha:1];
    
    NSMutableArray *cones = [[NSMutableArray alloc] initWithArray:self.viewControllers];
    
    for (NSInteger i = 0; i < cones.count; i ++) {
        
        UIViewController *vc = cones[i];
        MSNaviController *navi = [[MSNaviController alloc] initWithRootViewController:vc];
        cones[i] = navi;
        
    }
    
    self.viewControllers = cones;
    
    
}


@end
