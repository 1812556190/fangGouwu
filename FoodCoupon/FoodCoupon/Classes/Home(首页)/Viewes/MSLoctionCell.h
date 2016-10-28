//
//  MSLoctionCell.h
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBaseTableViewCell.h"

@protocol MSLoctionCellDelegate <NSObject>


//点击按钮时调用
- (void)didSelectCellBtn:(UIButton *)btn;


@end


@interface MSLoctionCell : MSBaseTableViewCell


/**
 热门城市数组
 */
@property (nonatomic, strong)NSArray *btnTites;


@property (nonatomic, weak) id <MSLoctionCellDelegate> loctionCellDelegate;




@end
