//
//  NSMutableAttributedString+XS.h
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (XS)


//给文字添加划掉线
+ (instancetype)formattStrNorame:(NSString *)text crossOutStr:(NSString *)str;


@end
