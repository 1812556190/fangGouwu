//
//  MSThereBtnView.h
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSThereBtnViewDelegate <NSObject>


@optional
- (void)didSelecteBtnAction:(UIButton *)btn;//代理点击事件

@end

@interface MSThereBtnView : UIView


@property (strong, nonatomic)NSArray<NSString *> *btnTextes;


@property (nonatomic, weak) id <MSThereBtnViewDelegate> thereBtnDelegate;

- (instancetype)initWithThereBtnViewHeight:(CGFloat)btnHeight btnTitles:(NSArray<NSString *> *)titles;

@end
