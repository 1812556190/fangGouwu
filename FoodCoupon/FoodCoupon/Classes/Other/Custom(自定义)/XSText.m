//
//  XSText.m
//  FoodCoupon
//
//  Created by apple on 14/10/27.
//  Copyright © 2014年 Lingser. All rights reserved.
//  简单的富文本处理

#import "XSText.h"

#define TEXTFONT 13



@implementation XSText


+ (NSAttributedString *)addSetterAttributFont:(UIFont *)font attributColor:(UIColor *)color attributes:(NSArray *)attribut{
    NSMutableAttributedString *mutableAtt = [[NSMutableAttributedString alloc] initWithString:@""];
    if ([attribut[0] isKindOfClass:[NSString class]]) {
        for (NSString *str in attribut) {
          NSAttributedString *tempAtt = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}];
            //全部拼接起来
            [mutableAtt appendAttributedString:tempAtt];
        }
    }else if([attribut[0] isKindOfClass:[NSAttributedString class]]){
        for (NSAttributedString *att in attribut) {
            NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithAttributedString:att];
            NSRange rang = {0,temp.length};
            [temp addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:rang];
            [mutableAtt appendAttributedString:temp];
        }
    }
    return mutableAtt;
}



//给指定文字添加下划线
+ (NSAttributedString *)addUnderline:(NSString *)lineStr strUnderlineColor:(UIColor *)lineColor{
    
    if (lineColor == nil) {
        lineColor = [UIColor blackColor];
    }
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:lineStr attributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:lineColor}];
    
    return text;
}


//给指定文字添加删除线
+ (NSAttributedString *)addStrikethroughstrikethroughColor:(UIColor *)color strikethroughType:(NSUInteger)type Text:(NSString *)text{
    NSAttributedString *str;
    if (type == 0) {//细实线
        str = [[NSAttributedString alloc] initWithString:text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrikethroughColorAttributeName:color}];
    }else if (type == 1){//细虚线
        str = [[NSAttributedString alloc] initWithString:text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternDot),NSStrikethroughColorAttributeName:color}];
    }else{//粗实线
       str = [[NSAttributedString alloc] initWithString:text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleThick),NSStrikethroughColorAttributeName:color}];
    }
    
    return str;
}

//实现简单的图文混排

+ (NSAttributedString *)addTextImageType:(TextImageType)type imageSize:(CGSize)size Text:(NSString *)text textImage:(NSString *)image{
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc]init];
    textAttachment.image = [UIImage imageNamed:image];
    textAttachment.bounds = CGRectMake(0,-2,size.width,size.height);
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@""];
    if (type == TextImageTypeLeft) {
        [att appendAttributedString:[NSMutableAttributedString attributedStringWithAttachment:textAttachment]];
        [att appendAttributedString:[[NSAttributedString alloc] initWithString:text]];
        
    }else{
        att = [[NSMutableAttributedString alloc] initWithString:text];
        [att appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
    }
    return att;
}



@end
