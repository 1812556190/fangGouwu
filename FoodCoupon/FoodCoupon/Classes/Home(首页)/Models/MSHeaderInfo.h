//
//  MSHeaderInfo.h
//  FoodCoupon
//
//  Created by apple on 16/10/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSHeaderInfo : NSObject


/**
 当前页面滚动图片的所有URL
 */
@property (nonatomic, strong) NSArray *scrollImages;

/**
 当前页面所有按钮的图片
 */
@property (nonatomic, strong) NSArray *btnImages;

/**
 当前页面所有按钮的标题
 */
@property (nonatomic, strong) NSArray *btnTitles;

@end
