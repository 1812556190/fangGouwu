//
//  MSSelectView.m
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSSelectView.h"

#import "MSBarBtn.h"

#define TabBarHeight 80


@interface MSSelectView (){
    UIView *_lineView;
    MSBarBtn *_btn;
}

@property (strong, nonatomic)UIScrollView *scrollView;

@property (strong, nonatomic)NSMutableArray *btnes;

@property (strong, nonatomic)NSMutableArray *lineViewes;


@end

@implementation MSSelectView



- (instancetype)initWithSclectViewFrame:(CGRect)frame scrollBarTitles:(NSArray<NSString *> *)titles{
    self = [self initWithFrame:frame];
    
    self.scrollBarTitles = titles;
    
    return self;
}


- (void)setScrollBarTitles:(NSArray<NSString *> *)scrollBarTitles{
    _scrollBarTitles = scrollBarTitles;
    
    [self setterLoadSubView];
    


    
}


- (void)setterLoadSubView{
    
    [self addSubview:self.scrollView];
    
    NSInteger count = self.scrollBarTitles.count;
    self.scrollView.contentSize = CGSizeMake(self.width,TabBarHeight * count);
    
    for (NSInteger i = 0; i < count; i ++) {
        CGFloat barY = TabBarHeight * i;
        UIView *barView = [self creatViewFrameY:barY btnTag:i btnNormalImage:nil btnSelectImage:nil btnTitle:self.scrollBarTitles[i]];
    
        [self.scrollView addSubview:barView];
        self.btnes[i] = _btn;
        self.lineViewes[i] = _lineView;
    }
    self.currentIndex = 0;
    
    
    
    [self tabBarBtnAction:self.btnes[0]];
}



#pragma mark - 点击事件

- (void)tabBarBtnAction:(UIButton *)btn{
    
   _lineView = self.lineViewes[btn.tag];
    [self changeLineStatalineColor:[UIColor colorWithHex:0xffa200] lineHeight:3];
  
    if (btn.tag == _currentIndex) {
        if (btn.tag == 0) {
           _btn = self.btnes[0];
            _btn.selected = YES;
        }
        return;
    }
    
    [self changeBtnTag:btn.tag];//改变状态
    
    //调用代理方法
    if ([self.selectDelegate respondsToSelector:@selector(didSelectBtnOnAction:)]) {
        [self.selectDelegate didSelectBtnOnAction:btn];
    }

}

- (void)changeBtnTag:(NSInteger)tag{
    
    //选择当前的状态
    self.currentIndex = tag;
    _btn = self.btnes[tag];
    _btn.selected = YES;
    
    //关闭上一个选择状态
    for (int i = 0; i < self.btnes.count; i++) {
        if (i != self.currentIndex) {
            
            _btn = self.btnes[i];
            _btn.selected = NO;
            
            _lineView = self.lineViewes[i];
            [self changeLineStatalineColor:[UIColor colorWithHex:0xb2b2b2] lineHeight:1];
        }
    }
    
    if (self.currentIndex == 4) {
        [self.scrollView setContentOffset:CGPointMake(0, TabBarHeight) animated:YES];
    }
}


- (void)changeLineStatalineColor:(UIColor *)color lineHeight:(CGFloat)height{
    _lineView.backgroundColor = color;
    _lineView.height = height;
    _lineView.y = TabBarHeight - height;
}




#pragma mark - 懒加载视图


- (UIScrollView *)scrollView{
    if (!_scrollView) {
        CGRect scrollViewFrame = self.frame;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.backgroundColor = [UIColor colorWithHex:0xfbf9f9];
        _scrollView = scrollView;
    }
    return _scrollView;
}


- (UIView *)creatViewFrameY:(CGFloat)frameY btnTag:(NSInteger)tag btnNormalImage:(NSString *)normalImage btnSelectImage:(NSString *)selectImage btnTitle:(NSString *)title{
    
    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0,frameY,self.width, TabBarHeight)];
    tabBarView.backgroundColor = [UIColor colorWithHex:0xfbf9f9];
    
    //创建线条
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor colorWithHex:0xb2b2b2];
    _lineView.frame = CGRectMake(5,tabBarView.height - 1, tabBarView.width - 10, 1);
    _lineView.tag = tag;
    _lineView.cornerRadius = 0.5;
    [tabBarView addSubview:_lineView];
    
    MSBarBtn *btn = [MSBarBtn buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    btn.frame = CGRectMake(0,0,tabBarView.width,tabBarView.height);
    
    [btn customBtnImage:normalImage btnAction:@selector(tabBarBtnAction:) btnTarget:self btnTitColor:[UIColor colorWithHex:0xb2b2b2] btnTitle:title];
    [btn setTitleColor:[UIColor colorWithHex:0xffa200] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    _btn = btn;
    [tabBarView addSubview:btn];
    
    return tabBarView;
}




- (NSMutableArray *)btnes{
    if (!_btnes) {
        _btnes = [NSMutableArray array];
    }
    return _btnes;
}

- (NSMutableArray *)lineViewes{
    if (!_lineViewes) {
       _lineViewes = [NSMutableArray array];
    }
    return _lineViewes;
}



@end
