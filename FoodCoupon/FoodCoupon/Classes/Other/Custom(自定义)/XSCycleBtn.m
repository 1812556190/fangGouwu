//
//  XSCycleBtn.m
//  FoodCoupon
//
//  Created by apple on 14/10/26.
//  Copyright © 2014年 Lingser. All rights reserved.
//

#import "XSCycleBtn.h"

@interface XSCycleBtn (){
    CGFloat _btnHeight;
    CGFloat _btnViewWidth;
    NSInteger _btnNum;
    CGFloat _btnMarginX;
    CGFloat _btnMarginY;
}

@end

@implementation XSCycleBtn

//初始化方法
- (instancetype)initWithBtnViewBtnHeight:(CGFloat)btnHeight btnViewFrame:(CGRect)viewFrame btnLayoutNum:(NSInteger)btnNum btnMargin:(CGPoint)margin {
    self = [self initWithFrame:viewFrame];
    
    _btnMarginX = margin.x;
    _btnMarginY = margin.y;
    
    _btnNum = btnNum;
    _btnHeight = btnHeight;
    _btnViewWidth = viewFrame.size.width;
       
    
    return self;
}

- (void)setBtnNormelImages:(NSArray *)btnNormelImages{
    _btnNormelImages = btnNormelImages;
    
    if (self.buttones.count == self.btnNormelImages.count) {
        [self setterBtnAttribute];
        return;
    }
    [self creatSubBtn];
}



- (void)setBtnTitles:(NSArray *)btnTitles{
    _btnTitles = btnTitles;
    if (self.buttones.count == self.btnTitles.count) {
        [self setterBtnAttribute];
        return;
    }
    [self creatSubBtn];
}


- (void)setterBtnAttribute{
    
    for (NSInteger i = 0; i < self.buttones.count; i++) {
        UIButton *btn = self.buttones[i];
        if (self.btnTitles.count != 0) {
            [btn setTitle:self.btnTitles[i] forState:UIControlStateNormal];
        }
        if (self.btnNormelImages.count != 0) {
            [btn setImage:[UIImage imageNamed:self.btnNormelImages[i]] forState:UIControlStateNormal];
            if (self.btnSelectImages.count != 0) {
                [btn setImage:[UIImage imageNamed:self.btnSelectImages[i]]forState:UIControlStateSelected];
            }
        }
    }
    
}




#pragma mark - 设置所有按钮
- (void)creatSubBtn{
    
    //将上一次的按钮全部移除 解决循环创建按钮
    if (self.buttones.count > 0) {
        for (UIButton *btn in self.buttones) {
            [btn removeFromSuperview];
        }
        [self.buttones removeAllObjects];
    }
   
    
    NSInteger count = self.btnTitles.count;
   
    if (self.btnTitles.count == 0) {
        count = self.btnNormelImages.count;
    }
    for (NSInteger i = 0; i < count; i ++) {
       
        NSInteger row = i % _btnNum;
        NSInteger line = i / _btnNum ;
        CGFloat w = (_btnViewWidth - (_btnNum + 1) * _btnMarginX) / _btnNum;
        CGFloat h = _btnHeight;
        CGFloat y = _btnMarginY + h * line +_btnMarginY * line;
        CGFloat x = _btnMarginX + _btnMarginX * row + w * row;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor colorWithHex:0x33383b] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(x, y, w,h);
        [self addSubview:btn];
        [self.buttones addObject:btn];
    }
    [self setterBtnAttribute];
   
    
    //重新设置view的高度
    CGFloat btnH = _btnHeight + _btnMarginY;
    self.height = btnH * (count / _btnNum);
    if (count % _btnNum != 0) {
       self.height = self.height + btnH;
    }
}


#pragma mark -  懒加载数组
- (NSMutableArray *)buttones{
    if (!_buttones) {
        _buttones = [NSMutableArray array];
    }
    return _buttones;
}


#pragma mark - 点击事件

- (void)btnAction:(UIButton *)btn{
    
    if ([self.cycleDelegate respondsToSelector:@selector(didSelectCycleBtnAction:)]) {
        [self.cycleDelegate didSelectCycleBtnAction:btn];
    }
}


@end
