//
//  MSSearchCell.h
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBaseTableViewCell.h"

@protocol MSSearchCellDelegate <NSObject>


//点击按钮时调用
- (void)didSelectCellBtn:(UIButton *)btn;


@end

@interface MSSearchCell : MSBaseTableViewCell


@property (nonatomic, weak) id<MSSearchCellDelegate> searchCellDelegate;



/**
 cell的标题
 */
@property (nonatomic, strong) NSString *cellTitle;


/**
 所有的按钮标题
 */
@property (nonatomic, strong) NSArray *btnTitles;


@end
