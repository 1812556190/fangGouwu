//
//  UIButton+XS.m
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIButton+XS.h"

@implementation UIButton (XS)


- (instancetype)customBtnImage:(NSString *)image btnAction:(SEL)btnAction btnTarget:(id)target btnTitColor:(UIColor *)titColor btnTitle:(NSString *)title{

    [self setTitle:title forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    if (titColor != nil) {
        [self setTitleColor:titColor forState:UIControlStateNormal];
    }
    [self addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;
}

@end
