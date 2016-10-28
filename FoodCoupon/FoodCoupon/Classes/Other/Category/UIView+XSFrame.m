//
//  UIView+XSFrame.m
//  XSNews
//
//  Created by apple on 16/8/13.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIView+XSFrame.h"

@implementation UIView (XSFrame)

//自己实现set方法
@dynamic borderColor,borderWidth,cornerRadius;




//实现故事版设置圆角
- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    self.layer.cornerRadius = cornerRadius;
}
//实现故事版设置边框宽度
- (void)setBorderWidth:(CGFloat)borderWidth{
    
    self.layer.borderWidth = borderWidth;
}

////实现故事版设置边框颜色
- (void)setBorderColor:(UIColor *)borderColor{
    
    self.layer.borderColor = borderColor.CGColor;
}




- (CGFloat)leftMargin {
    return CGRectGetMinX(self.frame);
}
- (void)setLeftMargin:(CGFloat)leftMargin {
    CGRect frame = self.frame;
    frame.origin.x = leftMargin;
    self.frame = frame;
}

- (CGFloat)rightMargin {
    return CGRectGetMaxY(self.frame);
}
- (void)setRightMargin:(CGFloat)rightMargin {
    CGRect frame = self.frame;
    frame.origin.x = rightMargin-CGRectGetWidth(frame);
    self.frame = frame;
}



- (CGFloat)bottomMargin {
    return CGRectGetMaxY(self.frame);
}
- (void)setBottomMargin:(CGFloat)bottomMargin {
    CGRect frame = self.frame;
    frame.origin.x = bottomMargin-self.height;
    self.frame = frame;
}


- (CGFloat)heightMargin {
    return CGRectGetHeight(self.frame);
}
- (void)setHeightMargin:(CGFloat)heightMargin {
    CGRect frame = self.frame;
    frame.size.height = heightMargin;
    self.frame = frame;
}


- (CGSize)size {
    return self.frame.size;
}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}




- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}



- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}





@end
