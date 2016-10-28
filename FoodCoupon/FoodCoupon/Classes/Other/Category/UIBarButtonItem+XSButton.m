//
//  UIBarButtonItem+XSButton.m
//  XSCoding
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIBarButtonItem+XSButton.h"

@implementation UIBarButtonItem (XSButton)



+ (instancetype)customItemNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectImage target:(id)target action:(SEL)action{
    
    UIImage *norImage = [UIImage imageNamed:normalImage];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0,norImage.size.width, norImage.size.height);
    [btn setImage:norImage forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
   
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (instancetype)customItemNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectColor target:(id)target action:(SEL)action btnTitle:(NSString *)title{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:selectColor forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
