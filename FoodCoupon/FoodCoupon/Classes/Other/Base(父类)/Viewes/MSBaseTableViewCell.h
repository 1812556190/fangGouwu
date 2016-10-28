//
//  MSBaseTableViewCell.h
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface MSBaseTableViewCell : UITableViewCell



/*
 * 加载子View
 */
- (void)cellDidLoadSubView;

/*
 * 调整布局
 */
- (void)cellDidAdjustAutoLayout;

@end
