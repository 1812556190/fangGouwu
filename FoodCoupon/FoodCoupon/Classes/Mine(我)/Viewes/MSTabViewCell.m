//
//  MSTabViewCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTabViewCell.h"
#import "XSCustomBtn.h"


@interface MSTabViewCell ()

@end

@implementation MSTabViewCell


#pragma mark - 按钮的点击事件

- (void)btnAction:(UIButton *)btn{
    
}


#pragma mark - 创建初始化视图
- (void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    
    NSArray *titArray = @[@"待付款",@"待发货",@"待收货",@"待评价",@"退款/退货"];
    NSArray *imageArray = @[@"user_topay",@"userPendingSend",@"user_rec",@"user_done",@"userRefund"];

    for (NSInteger i = 0; i < titArray.count; i ++) {
        CGFloat btnX = i * (XSSREENWIDTH / 5);
        [self customBtnImage:imageArray[i] btnX:btnX btnTag:i btnTitle:titArray[i]];
    }
}

//所有的按钮
- (void)customBtnImage:(NSString *)image btnX:(CGFloat)btnX btnTag:(NSInteger)btnTag btnTitle:(NSString *)title{
    
    XSCustomBtn *btn = [XSCustomBtn buttonWithType:UIButtonTypeCustom];
    btn.tag = btnTag;
    btn.frame = CGRectMake(btnX,0,XSSREENWIDTH / 5, self.contentView.height);
    [btn customBtnImage:image btnAction:@selector(btnAction:) btnTarget:self btnTitColor:[UIColor colorWithHex:0xc8c9cb] btnTitle:title];
    
    [self.contentView addSubview:btn];
}






@end
