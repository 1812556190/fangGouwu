//
//  XSToolHttpRequst.h
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSToolHttpManager.h"

@interface XSToolHttpRequst : NSObject





+ (void)requstNativeParameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHande;

@end
