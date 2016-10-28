//
//  MSLoctionCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSLoctionCell.h"


@interface MSLoctionCell ()


@end

@implementation MSLoctionCell

#pragma mark - 按钮点击事件
- (void)btnAction:(UIButton *)btn{
    
    if ([self.loctionCellDelegate respondsToSelector:@selector(didSelectCellBtn:)]) {
        [self.loctionCellDelegate didSelectCellBtn:btn];
    }
}

- (void)setBtnTites:(NSArray *)btnTites{
    _btnTites = btnTites;
    
    [self creatSubBtn];
}


- (void)creatSubBtn{
    
    NSInteger count = self.btnTites.count;
    
    for (NSInteger i = 0; i < count; i ++) {
        
        CGFloat w = (XSSREENWIDTH - 50) / 4;
        CGFloat h = 30;
        CGFloat y = 10;
        CGFloat x = 10 + (i * 10) + (w * i);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"address_station"] forState:UIControlStateNormal];
        [btn setTitle:self.btnTites[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHex:0x33383b] forState:UIControlStateNormal];
        btn.tag = i;
        [self.contentView addSubview:btn];
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(x, y, w,h);
    }
    
}


@end
