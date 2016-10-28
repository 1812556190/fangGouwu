//
//  MSTabCellBtn.h
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTabCellBtn : UIButton


/**
 底部提示文字
 */
@property (nonatomic, copy) NSString *bottomText;


/**
 自定义按钮初始化方法

 @param image 图片
 @param tit   标题

 @return 返回对象
 */
- (instancetype)initWithBtnImage:(NSString *)image btnCenterTit:(NSString *)tit;

@end
