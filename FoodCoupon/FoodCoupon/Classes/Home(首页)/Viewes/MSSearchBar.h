//
//  MSSearchBar.h
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSSearchBarDelegate <NSObject>

- (void)changeTextFiled:(UITextField *)text searchText:(NSString *)text;

@end

@interface MSSearchBar : UIView


@property (nonatomic, weak) id<MSSearchBarDelegate> searchDelegate;



/**
 自定义搜索栏

 @param width 宽度
 @param placeholderText 提示文字
 @return <#return value description#>
 */
- (instancetype)initWithSearchViewFrameWidth:(CGFloat)width placeholderText:(NSString *)placeholderText;

@end
