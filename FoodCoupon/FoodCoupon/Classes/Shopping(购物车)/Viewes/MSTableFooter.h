//
//  MSTableFooter.h
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTableFooter : UICollectionView



/**
 自定义初始化方法

 @return <#return value description#>
 */
- (instancetype)initWithCustomCollectionView;


//重新加载高度
- (void)cellLoadHeight;


@end
