//
//  MSNaviController.m
//  FoodCoupon
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSNaviController.h"

@interface MSNaviController ()

@end

@implementation MSNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count == 0) {
        
    }else{
      viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem customItemNormalImage:@"blackBack" selectedImage:nil target:self action:@selector(leftCancelAction:)];
    }
    [super pushViewController:viewController animated:animated];
}


- (void)leftCancelAction:(UIButton *)btn{
    
    [self popViewControllerAnimated:YES];
}


@end
