//
//  UIButton+XS.h
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XS)


- (instancetype)customBtnImage:(NSString *)image btnAction:(SEL)btnAction btnTarget:(id)target btnTitColor:(UIColor *)titColor btnTitle:(NSString *)title;

@end
