//
//  MSTabViewHeader.m
//  FoodCoupon
//
//  Created by apple on 16/10/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTabViewHeader.h"
#import "SDCycleScrollView.h"
#define HEIGHT 200

#define ScrollHeight 130

#define BtnTitleFont 11

@interface MSTabViewHeader ()<SDCycleScrollViewDelegate>

@property (strong, nonatomic)SDCycleScrollView *cycleScroll;

@property (strong, nonatomic)UIView *btnView;



@end

@implementation MSTabViewHeader


- (instancetype)initWithTabViewHeaderScrollImagees:(NSArray *)scrollImagees btnImagees:(NSArray *)imagees btnTitle:(NSArray *)tites{
    self = [self initWithFrame:CGRectMake(0, 0,XSSREENWIDTH, HEIGHT)];
    if (self) {
     
        self.scrolImagees = scrollImagees;
        self.btnImagees = imagees;
        self.btnTitle = tites;
        
        [self creatloadSubView];// 添加视图
        [self loadData];//加载数据
 
    }
    return self;
}

- (void)loadData{
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.cycleScroll.imageURLStringsGroup = self.scrolImagees;
    });
    
}


- (void)creatloadSubView{
    
    [self addSubview:self.cycleScroll];
   
    [self addSubview:self.btnView];
    
}

#pragma mark -点击事件
- (void)btnAction:(UIButton *)btn{
    NSLog(@"btn == %ld",btn.tag);
}


- (UIView *)btnView{
    if (!_btnView) {
        _btnView = [[UIView alloc] init];
        _btnView.backgroundColor = [UIColor whiteColor];
        
        _btnView.frame = CGRectMake(0,ScrollHeight,XSSREENWIDTH,HEIGHT - ScrollHeight);

        for (NSInteger i = 0; i < self.btnTitle.count; i++) {
            CGFloat btnW = self.width / self.btnTitle.count;
            CGFloat btnX = btnW * i;
            
            if (self.btnImagees.count != 0) {
                CGRect btnFrame = CGRectMake(btnX, 0, btnW, _btnView.height);
                UIButton *btn = [self creatBtnTag:i btnFrame:btnFrame btnImage:self.btnImagees[i]];
                [_btnView addSubview:btn];
            }
            
            
            CGRect labelFrame = CGRectMake(btnX,_btnView.height - 20, btnW,15);
            
            UILabel *label = [self creatLabelFrame:labelFrame labelText:self.btnTitle[i]];
            
            [_btnView addSubview:label];
            
        }
    }
    return _btnView;
}


- (UIButton *)creatBtnTag:(NSInteger)btnTag btnFrame:(CGRect)frame btnImage:(NSString *)image{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = btnTag;
    btn.frame = frame;
    btn.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    [btn customBtnImage:image btnAction:@selector(btnAction:) btnTarget:self btnTitColor:nil btnTitle:nil];
    return btn;
}

- (UILabel *)creatLabelFrame:(CGRect)frame labelText:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.textColor = [UIColor colorWithHex:0xaeaeae];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:BtnTitleFont];
    
    return label;
}


- (SDCycleScrollView *)cycleScroll{
    if (!_cycleScroll) {
        // 网络加载 --- 创建带标题的图片轮播器
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, XSSREENWIDTH,ScrollHeight) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        _cycleScroll = cycleScrollView2;
    }
    return _cycleScroll;
}




@end
