//
//  XSText.h
//  FoodCoupon
//
//  Created by apple on 14/10/27.
//  Copyright © 2014年 Lingser. All rights reserved.
//  简单的富文本处理

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TextImageType) {
    TextImageTypeLeft = 0,
    TextImageTypeRight
};

@interface XSText : NSObject

/**
 修改富文本的属性 拼接所有的富文本
 @param font     设置所有的字体
 @param color    <#color description#>
 @param attribut <#attribut description#>

 @return <#return value description#>
 */
+ (NSAttributedString *)addSetterAttributFont:(UIFont *)font attributColor:(UIColor *)color attributes:(NSArray *)attribut;


/**
 给指定文字添加下划线

 @param lineStr   <#lineStr description#>
 @param lineColor <#lineColor description#>

 @return <#return value description#>
 */
+ (NSAttributedString *)addUnderline:(NSString *)lineStr strUnderlineColor:(UIColor *)lineColor;



/**
 给指定文字添加删除线

 @param color <#color description#>
 @param type  <#type description#>
 @param text  <#text description#>

 @return <#return value description#>
 */
+ (NSAttributedString *)addStrikethroughstrikethroughColor:(UIColor *)color strikethroughType:(NSUInteger)type Text:(NSString *)text;


/**
 实现简单的图文混排

 @param type  图片所在文字的位置
 @param size  <#size description#>
 @param text  <#text description#>
 @param image <#image description#>

 @return <#return value description#>
 */
+ (NSAttributedString *)addTextImageType:(TextImageType)type imageSize:(CGSize)size Text:(NSString *)text textImage:(NSString *)image;


@end
