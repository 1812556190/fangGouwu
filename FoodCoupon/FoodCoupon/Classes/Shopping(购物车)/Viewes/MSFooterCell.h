//
//  MSFooterCell.h
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSFooterCellDelegate <NSObject>

- (void)didSelectAddCartBtn:(UIButton *)btn;

@end

@interface MSFooterCell : UICollectionViewCell


@property (nonatomic, weak) id<MSFooterCellDelegate> footerDelegate;

@end
