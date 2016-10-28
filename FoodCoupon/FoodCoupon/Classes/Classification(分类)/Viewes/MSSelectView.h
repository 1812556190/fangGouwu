//
//  MSSelectView.h
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSSelectViewDelegate <NSObject>

- (void)didSelectBtnOnAction:(UIButton *)btn;

@end

@interface MSSelectView : UIView


@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSArray<NSString *> *scrollBarTitles;

@property (nonatomic, weak) id<MSSelectViewDelegate> selectDelegate;


- (instancetype)initWithSclectViewFrame:(CGRect)frame scrollBarTitles:(NSArray<NSString *> *)titles;

@end
