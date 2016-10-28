//
//  BSOrderStatusView.m
//  BuyAndSend
//
//  Created by  on 16/3/24.
//  Copyright © 2016年 mjia. All rights reserved.
//

#import "DTStatusView.h"

@interface DTStatusView ()<UIScrollViewDelegate>{
    CGFloat _tabWidthes;
    NSInteger _topCount;
}

@property (strong, nonatomic) UIScrollView *tabScorView;




@end


@implementation DTStatusView

//界面搭建
- (void)setUpStatusButtonWithTitlt:(NSArray *)titleArray NormalColor:(UIColor *)normalColor SelectedColor:(UIColor *)selectedColor LineColor:(UIColor *)lineColor{
    
    //按钮创建
    CGFloat width = TabItemWidth;//按钮的宽度
    _tabWidthes = width * titleArray.count;
    _topCount = titleArray.count;
    for (int i = 0; i < titleArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:TabTtemFont];
        button.frame = CGRectMake(width*i, 0, width, self.frame.size.height);
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:(normalColor)?normalColor:[UIColor colorWithRed:139/255.0 green:141/255.0 blue:141/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
        button.tag = i;
        [button addTarget:self action:@selector(buttonTouchEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabScorView addSubview:button];
        [self.buttonArray addObject:button];
        
        if (i == 0) {
            button.selected = YES;
        }
    }
    self.currentIndex = 0;
    
    //线条
    if (lineColor) {
        
        self.lineView.frame = CGRectMake((width - width/2) / 2, self.frame.size.height - 5,width/2, 2);
        self.lineView.backgroundColor = lineColor;
    }
    
}

//状态切换
- (void)buttonTouchEvent:(UIButton *)button{
    
    if (button.tag == self.currentIndex) {
        return;
      }
    //代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(statusViewSelectIndex:)]) {
        
        [self.delegate statusViewSelectIndex:button.tag];
       }
    if (!_isScroll) {
        [self changeTag:(int)button.tag];
      }
}

#pragma mark - UIScrollViewDelegate




#pragma 懒加载

- (UIScrollView *)tabScorView{
    if (!_tabScorView) {
        CGRect scrollViewFrame = self.bounds;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(_tabWidthes,self.frame.size.height);
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        _tabScorView = scrollView;
    }
    return _tabScorView;
}


- (NSMutableArray *)buttonArray{
    
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    
    return _buttonArray;
}


-(void)changeTag:(int)tag
{
    NSInteger num = kScreenWidth / TabItemWidth / 2;
    
    CGFloat conOffX = self.tabScorView.contentOffset.x;
    if (tag > _topCount - num || tag < num + 1) {
        if (conOffX == TabItemWidth) {
             [self.tabScorView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }else if (tag > 2 ) {
        [self.tabScorView setContentOffset:CGPointMake(TabItemWidth * (tag - 2), 0) animated:YES];
    }else if(tag % 2 == 0){
        
         [self.tabScorView setContentOffset:CGPointMake(conOffX - TabItemWidth, 0) animated:YES];
    }

    
    //选择当前的状态
    self.currentIndex = tag;
    UIButton *button = self.buttonArray[tag];
    button.selected = YES;
    
    //关闭上一个选择状态
    for (int i = 0; i < self.buttonArray.count; i++) {
        if (i != self.currentIndex) {
            
            UIButton *button = self.buttonArray[i];
            button.selected = NO;
        }
    }
    
    //移动横线到对应的状态
    if (self.lineView) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            CGRect frame = self.lineView.frame;
            float origin = _tabWidthes/self.buttonArray.count * tag + frame.size.width / 2;
            frame.origin.x = origin;
            self.lineView.frame = frame;
        }];
    }
    
  
}
//下面滑动的横线
- (UIView *)lineView{

    if (!_lineView) {
        
        _lineView = [[UIView alloc] init];
        [self.tabScorView addSubview:self.lineView];
    }
    return _lineView;
}

@end
