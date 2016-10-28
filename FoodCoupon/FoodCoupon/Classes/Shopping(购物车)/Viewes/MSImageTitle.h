//
//  MSImageTitle.h
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,RightTextMode){
    RightTextModeOrdinary = 0,
    RightTextModeAttributed
};

@interface MSImageTitle : UIView


/**
 左边的图片
 */
@property (nonatomic, copy) NSString *leftImage;


/**
 右边的文字
 */
@property (nonatomic, copy) NSString *rightText;


/**
 文本的类型
 */
@property (nonatomic, assign) RightTextMode textType;



/**
 自定义初始化方法

 @param frame     <#frame description#>
 @param type      <#type description#>
 @param leftImage <#leftImage description#>
 @param text      <#text description#>

 @return <#return value description#>
 */
- (instancetype)initWithViewFrame:(CGRect)frame textType:(RightTextMode)type leftImage:(NSString *)leftImage rightText:(NSString *)text;

@end
