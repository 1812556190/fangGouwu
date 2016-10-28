//
//  XSToolHttpRequst.m
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSToolHttpRequst.h"
#import "XSHUDView.h"

@interface XSToolHttpRequst ()


@end


@implementation XSToolHttpRequst



+ (void)requstNativeParameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHande{
    
    [[XSToolHttpManager shareInstance] postHttpUrl:@"http://app.gegejia.com/yangege/appNative/resource/homeList" Parameter:parameter withSuccessHander:^(id resulst, NSError *error) {
        
        successHande(resulst,error);
    }];
    
}




@end
