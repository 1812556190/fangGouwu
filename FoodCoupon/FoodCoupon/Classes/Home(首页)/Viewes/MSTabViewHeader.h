//
//  MSTabViewHeader.h
//  FoodCoupon
//
//  Created by apple on 16/10/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTabViewHeader : UIView


/**
 滚动图片数组
 */
@property (nonatomic, strong) NSArray *scrolImagees;

/**
 按钮图片数组
 */
@property (nonatomic, strong) NSArray *btnImagees;

/**
 按钮文字数组
 */
@property (nonatomic, strong) NSArray *btnTitle;


/**
 tableview头视图

 @param scrollImagees 滚动图片数组
 @param imagees       按钮图片数组
 @param tites         按钮文字数组

 @return <#return value description#>
 */
- (instancetype)initWithTabViewHeaderScrollImagees:(NSArray *)scrollImagees btnImagees:(NSArray *)imagees btnTitle:(NSArray *)tites;

@end
