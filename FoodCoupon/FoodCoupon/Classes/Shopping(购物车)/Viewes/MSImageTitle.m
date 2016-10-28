//
//  MSImageTitle.m
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSImageTitle.h"

#define LabelTextFont 13
#define leftImageWH 20

@interface MSImageTitle ()

@property (strong, nonatomic) UILabel *rightLabel;

@property (strong, nonatomic)  UIImageView *leftImageView;


@end

@implementation MSImageTitle



- (instancetype)initWithViewFrame:(CGRect)frame textType:(RightTextMode)type leftImage:(NSString *)leftImage rightText:(NSString *)text{
    
    self = [self initWithFrame:frame];
    
    self.backgroundColor = [UIColor colorWithHex:0xffffff];
    
    [self addSubview:self.rightLabel];
    [self addSubview:self.leftImageView];
    
    self.textType = type;
    self.leftImage = leftImage;
    self.rightText = text;
    
    
    
    
    return self;
    
}

#pragma mark - 设置图片

- (void)setLeftImage:(NSString *)leftImage{
    _leftImage = leftImage;
     self.leftImageView.image = [UIImage imageNamed:self.leftImage];
}

#pragma mark - 设置文字
- (void)setRightText:(NSString *)rightText{
    _rightText = rightText;
    [self showText];
    
}

//根据类型显示文字 图片
- (void)showText{
    self.rightLabel.x = self.leftImageView.width + 10;
    if (self.textType == RightTextModeOrdinary) {
        self.rightLabel.textColor = [UIColor colorWithHex:0x505050];
        self.rightLabel.font = [UIFont systemFontOfSize:LabelTextFont];
        self.rightLabel.text = self.rightText;
    }else if(self.textType == RightTextModeAttributed){
        self.rightLabel.attributedText = [self appendAttributdStr:self.rightText];
    }
    
   
}


#pragma mark - 加载视图
- (UILabel *)rightLabel{
    if (!_rightLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.bounds = CGRectMake(0, 0,XSSREENWIDTH - 35, leftImageWH);
        label.y = (self.height - leftImageWH) / 2;
        _rightLabel = label;
    }
    return _rightLabel;
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.bounds = CGRectMake(0, 0, leftImageWH, leftImageWH);
        imageV.y = (self.height - leftImageWH) / 2;
        imageV.x = 5.0;
        _leftImageView = imageV;
    }
    return _leftImageView;
}



//富文本属性
- (NSMutableAttributedString *)appendAttributdStr:(NSString *)timeStr{
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"请在" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:LabelTextFont],NSForegroundColorAttributeName:[UIColor colorWithHex:0x505050]}];
    NSMutableAttributedString *textTime = [[NSMutableAttributedString alloc] initWithString:timeStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:LabelTextFont],NSForegroundColorAttributeName:[UIColor colorWithHex:0xff3300]}];
    [text appendAttributedString:textTime];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"内提交订单,时间结束后商品可能被抢完" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:LabelTextFont],NSForegroundColorAttributeName:[UIColor colorWithHex:0x505050]}];
    [text appendAttributedString:str];
    
    return text;
}


@end
