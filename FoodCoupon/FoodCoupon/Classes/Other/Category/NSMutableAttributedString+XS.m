//
//  NSMutableAttributedString+XS.m
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "NSMutableAttributedString+XS.h"

@implementation NSMutableAttributedString (XS)

+ (instancetype)formattStrNorame:(NSString *)text crossOutStr:(NSString *)str{
    
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor colorWithHex:0xff3e00]}];
    
    //给文字添加划掉线
    NSAttributedString *attr_02 = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithHex:0xa0a0a0],NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),NSStrikethroughColorAttributeName:[UIColor colorWithHex:0xa0a0a0]}];
    
    [attr appendAttributedString:attr_02];//拼接两个富文本
    return attr;
}

+ (instancetype)formattStrNorame:(NSString *)text strNoramlColor:(UIColor *)noramColor crossOutStr:(NSString *)str outStrColor:(UIColor *)outColor{
    
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:noramColor}];
    
    //给文字添加划掉线
    NSAttributedString *attr_02 = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:outColor,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),NSStrikethroughColorAttributeName:outColor}];
    
    [attr appendAttributedString:attr_02];//拼接两个富文本
    return attr;
}


//给文字添加下划线
+ (instancetype)formattStrUnderline:(NSString *)lineStr strUnderlineColor:(UIColor *)lineColor strColor:(UIColor *)strColor{
    
     return [[NSMutableAttributedString alloc] initWithString:lineStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:strColor,NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:lineColor}];
}



@end
