//
//  MSGoodsCell.h
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBaseTableViewCell.h"

@protocol MSGoodsCellDelegate <NSObject>

//商品变化的数量
- (void)changeGoodsNumber:(NSInteger)goodsNumber;

@end

@interface MSGoodsCell : MSBaseTableViewCell


@property (nonatomic, weak) id<MSGoodsCellDelegate> goodsCellDelegate;

@end
