//
//  MSLoctionViewController.h
//  FoodCoupon
//
//  Created by apple on 16/10/20.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBaseViewController.h"

@interface MSLoctionViewController : MSBaseViewController


@property (nonatomic, copy) void(^cellTitBlock)(NSString *title);

@end
