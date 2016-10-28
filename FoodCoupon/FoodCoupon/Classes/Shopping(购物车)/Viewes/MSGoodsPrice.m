//
//  MSGoodsPrice.m
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSGoodsPrice.h"

@interface MSGoodsPrice ()

@property (weak, nonatomic) IBOutlet UIButton *selectedBtnAction;

@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;

@property (weak, nonatomic) IBOutlet UILabel *goodsName;

@property (weak, nonatomic) IBOutlet UIButton *settBtn;

@end

@implementation MSGoodsPrice


- (instancetype)initWithloadViewFrame:(CGRect)frame{
   
    
    NSArray *viewes = [[NSBundle mainBundle] loadNibNamed:@"MSGoodsPrice" owner:nil options:nil];
    self = [viewes lastObject];
     self.frame = frame;
    
//    self.settBtn.backgroundColor = [UIColor redColor];
    self.backgroundColor = [UIColor colorWithHex:0xffffff];
    
    self.isType = NO;
    self.goodsPrice.text = @"总计￥0";
    self.goodsName.text = self.currentGoodsName;
    self.goodsName.textColor = [UIColor lightGrayColor];
    
   
    return self;
}

- (IBAction)settlementBtn:(UIButton *)sender {
    
    NSLog(@"-------");
}

- (void)setGoodsNum:(NSNumber *)goodsNum{
    _goodsNum = goodsNum;
    
    CGFloat goodsPrictes = [self.goodsNum integerValue] * [self.price floatValue];
    self.goodsPrice.text = [NSString stringWithFormat:@"总计￥%.2f",goodsPrictes];
}


#pragma mark - 改变其状态


- (void)setIsType:(BOOL)isType{
    _isType = isType;
    if (self.isType) {
        self.goodsName.text = @"全选";
        self.goodsPrice.hidden = YES;
        [self.settBtn setTitle:@"删除" forState:UIControlStateNormal];
        return;
    }
    self.goodsName.text = @"...";
    self.goodsPrice.hidden = NO;
    [self.settBtn setTitle:@"去结算" forState:UIControlStateNormal];
}




@end
