//
//  MSGoodsPrice.h
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSGoodsPrice : UIView


@property (nonatomic, assign) BOOL isType;


/**
 商品的名字
 */
@property (nonatomic, copy) NSString *currentGoodsName;

/**
 商品的数量
 */
@property (nonatomic, copy) NSNumber *goodsNum;


/**
 商品的价格
 */
@property (nonatomic, copy) NSNumber *price;

- (instancetype)initWithloadViewFrame:(CGRect)frame;








@end
