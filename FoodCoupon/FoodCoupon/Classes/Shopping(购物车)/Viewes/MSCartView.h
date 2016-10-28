//
//  MSCartView.h
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSCartDelegate <NSObject>

- (void)didSelectedAction:(UIButton *)btn;//按钮点击事件的代理方法

@end

@interface MSCartView : UIView


/**
 gif图片的名字
 */
@property (nonatomic, copy) NSString *gifName;


@property (nonatomic, weak) id<MSCartDelegate> cartDelegate;


/**
 自定义加载XIB

 @param frame   位置
 @param gifName gif的名字

 @return <#return value description#>
 */
- (instancetype)initWithLoadNibViewFrame:(CGRect)frame imageGif:(NSString *)gifName;




@end
