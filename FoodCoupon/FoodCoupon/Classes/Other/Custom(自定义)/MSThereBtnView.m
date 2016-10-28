//
//  MSThereBtnView.m
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSThereBtnView.h"

@interface MSThereBtnView (){
    UIButton *_btn_01;
    UIButton *_btn_02;
    UIButton *_btn_03;
}

@property (strong, nonatomic)UIView *thereBtnView;

@end

@implementation MSThereBtnView



- (instancetype)initWithThereBtnViewHeight:(CGFloat)btnHeight btnTitles:(NSArray<NSString *> *)titles{
    self = [self initWithFrame:CGRectMake(0, 0,XSSREENWIDTH, btnHeight)];
    
    self.btnTextes = titles;
    
    return self;
}


- (void)setBtnTextes:(NSArray<NSString *> *)btnTextes{
    _btnTextes = btnTextes;
    
    [self addSubview:self.thereBtnView];
}


- (UIView *)thereBtnView{
    if (!_thereBtnView) {
        _thereBtnView = [[UIView alloc] initWithFrame:CGRectMake(0,0, XSSREENWIDTH, self.height)];
        CGFloat btnW = (XSSREENWIDTH - 2) / 3;
        
        _btn_01 = [self crectBtnX:0 btnTag:100 btnTitle:self.btnTextes[0]];
        _btn_01.selected = YES;
        [_thereBtnView addSubview:_btn_01];
        
        _btn_02 = [self crectBtnX:btnW + 1 btnTag:200 btnTitle:self.btnTextes[1]];
        [_thereBtnView addSubview:_btn_02];
        _btn_03 = [self crectBtnX:btnW * 2 + 2 btnTag:300 btnTitle:self.btnTextes[2]];
        [_thereBtnView addSubview:_btn_03];
        
        [self cellLineFrameX:btnW supView:_thereBtnView];
        [self cellLineFrameX:btnW * 2 + 1 supView:_thereBtnView];
        
    }
    return _thereBtnView;
}

- (UIButton *)crectBtnX:(CGFloat)btnX btnTag:(NSInteger)btnTag btnTitle:(NSString *)title{
    
    UIButton *btton = [UIButton buttonWithType:UIButtonTypeCustom];
    btton.frame = CGRectMake(btnX,0,(XSSREENWIDTH - 2) / 3,self.height);
    btton.tag = btnTag;
    [btton setTitleColor:[UIColor colorWithHex:0x949494] forState:UIControlStateNormal];
    [btton setTitleColor:[UIColor colorWithHex:0xff2d19] forState:UIControlStateSelected];
    [btton setTitle:title forState:UIControlStateNormal];
    
    [btton addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btton;
}

- (UIView *)cellLineFrameX:(CGFloat)frameX supView:(UIView *)cell{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(frameX,10, 1,self.height - 20)];
    line.backgroundColor = [UIColor colorWithHex:0xe0e0e0];
    [cell addSubview:line];
    return line;
}


#pragma mark - 按钮点击事件

- (void)cellBtnAction:(UIButton *)button{
    button.selected = !button.selected;
    
    if (button.tag == 100) {
        _btn_01.selected = YES;
        _btn_02.selected = NO;
        _btn_03.selected = NO;
    }else if (button.tag == 200){
        _btn_01.selected = NO;
        _btn_02.selected = YES;
        _btn_03.selected = NO;
        
    }else{
        _btn_01.selected = NO;
        _btn_02.selected = NO;
        _btn_03.selected = YES;
    }
    
    if ([self.thereBtnDelegate respondsToSelector:@selector(didSelecteBtnAction:)]) {
        [self.thereBtnDelegate didSelecteBtnAction:button];
    }
}


@end
