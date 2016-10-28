//
//  MSTitImageCell.h
//  FoodCoupon
//
//  Created by apple on 16/10/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBaseTableViewCell.h"

@interface MSTitImageCell : MSBaseTableViewCell


/**
 加载按钮样式的cell
 */
@property (strong, nonatomic) NSArray *btnImagees;


/**
 显示图片的cell
 */
@property (strong, nonatomic) NSString *imageUrl;

@end
