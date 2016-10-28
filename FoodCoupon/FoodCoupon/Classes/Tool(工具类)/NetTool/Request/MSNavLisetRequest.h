//
//  MSNavLisetRequest.h
//  FoodCoupon
//
//  Created by apple on 16/10/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSNavLisetRequest : NSObject


@property (nonatomic, copy) NSString *accountId;

@property (nonatomic, copy) NSString *channel;

@property (nonatomic, copy) NSString *imei;

@property (nonatomic, copy) NSString *os;

@property (nonatomic, strong)NSDictionary *params;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, copy) NSString *version;
@end
