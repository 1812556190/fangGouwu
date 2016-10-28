//
//  MSTabCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTabCell.h"

#import "MSTabCellBtn.h"

@implementation MSTabCell



#pragma mark - 按钮点击事件
- (void)btnAction:(UIButton *)btn{
    
    NSLog(@"----点击");
}




#pragma mark - 初始化视图

- (void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    
    self.contentView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
 
    NSArray *titArray = @[@"签到",@"收藏",@"优惠券",@"积分",@"新人专享",@"客服与帮助",@"意见与反馈",@"关于格格家"];
    NSArray *imageArray = @[@"user_signin",@"user_fav",@"myCoupons",@"myIntegral",@"user_newbie",@"user_contact",@"user_feedback",@"user_about"];
    for (NSInteger i = 0; i < 8; i ++) {
        NSInteger line = i / 4;
        NSInteger row = i % 4;
        CGFloat w = XSSREENWIDTH / 4;
        CGFloat h = 80;
        CGFloat x = row * w + row * 1;
        CGFloat y = line *h + line * 1;
        [self customBtnImage:imageArray[i] btnPoint:CGPointMake(x, y) btnTag:i btnTitle:titArray[i]];
    }
}



- (void)customBtnImage:(NSString *)image btnPoint:(CGPoint)point btnTag:(NSInteger)btnTag btnTitle:(NSString *)title{
    
    MSTabCellBtn *btn = [[MSTabCellBtn alloc] initWithBtnImage:image btnCenterTit:title];
    btn.bottomText = @"领取今日奖励";
    btn.backgroundColor = [UIColor colorWithHex:0xffffff];
    btn.tag = btnTag;
    btn.frame = CGRectMake(point.x,point.y,XSSREENWIDTH / 4,80);
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:btn];
}





@end
