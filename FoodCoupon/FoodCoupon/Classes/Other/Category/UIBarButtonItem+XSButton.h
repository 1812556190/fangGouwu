//
//  UIBarButtonItem+XSButton.h
//  XSCoding
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XSButton)




/**
 自定义BarItem

 @param normalImage 自然状态图片
 @param selectImage 选中状态图片
 @param target      对象
 @param action      方法

 @return 返回对象
 */
+ (instancetype)customItemNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectImage target:(id)target action:(SEL)action;

/**
 自定义BarItem
 
 @param normalColor 自然状态文字颜色
 @param selectColor 选中状态文字颜色
 @param target      对象
 @param action      方法
 @param title       标题
 
 @return 返回对象
 */
+ (instancetype)customItemNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectColor target:(id)target action:(SEL)action btnTitle:(NSString *)title;

@end
