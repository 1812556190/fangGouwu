//
//  XSCycleBtn.h
//  FoodCoupon
//
//  Created by apple on 14/10/26.
//  Copyright © 2014年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XSCycleBtnDelegate <NSObject>

- (void)didSelectCycleBtnAction:(UIButton *)button;

@end

@interface XSCycleBtn : UIView

@property (nonatomic, strong) NSArray  *btnTitles;

@property (nonatomic, strong) NSArray  *btnNormelImages;

@property (nonatomic, strong) NSArray  *btnSelectImages;

@property (strong, nonatomic)NSMutableArray *buttones;

@property (nonatomic, weak) id<XSCycleBtnDelegate> cycleDelegate;

/**
 * 初始化方法
 */
- (instancetype)initWithBtnViewBtnHeight:(CGFloat)btnHeight btnViewFrame:(CGRect)viewFrame btnLayoutNum:(NSInteger)btnNum btnMargin:(CGPoint)margin ;



@end
