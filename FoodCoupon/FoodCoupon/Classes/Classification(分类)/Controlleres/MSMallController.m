//
//  MSMallController.m
//  FoodCoupon
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSMallController.h"
#import "MSSearchController.h"

#import "MSBrandViewController.h"
#import "MSCategoryController.h"



@interface MSMallController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>{
    UIButton *_brandBtn;//品牌
    UIButton *_categoryBtn;//品类
    UIView *_line;
    CGFloat _lineW;
    NSInteger _pageCurrent;
}

@property (strong, nonatomic)UIView *titView;

@property (strong, nonatomic)UIPageViewController *pageConVc;

@property (strong, nonatomic)NSArray *viewControlleres;


@end

@implementation MSMallController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setterNaviGation];
    
    
    //设置pageVc
    [self.view addSubview:self.pageConVc.view];
    
    [self addChildViewController:self.pageConVc];//防止被释放
    
    [self currentVcIndex:0];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xffffff alpha:1]] forBarMetrics:UIBarMetricsDefault];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void)setterNaviGation{
    
    //设置右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem customItemNormalImage:@"navItemSearch" selectedImage:nil target:self action:@selector(rightAction:)];
    
    
    self.navigationItem.titleView = self.titView;
    
}

#pragma mark - 按钮点击事件
//跳转到搜索页面
- (void)rightAction:(UIButton *)btn{
    
    MSSearchController *searchVc = [[MSSearchController alloc] init];
    searchVc.hidesBottomBarWhenPushed = YES;//隐藏底部的tabbar
    
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark - UIPageViewControllerDelegate && UIPageViewControllerDataSource

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [self.viewControlleres indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.viewControlleres[index - 1];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [self.viewControlleres indexOfObject:viewController];
    if (index == 1) {
        return nil;
    }
    return self.viewControlleres[index + 1];
}

//当前控制器
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    
    //获取当前控制器所在数组中的下标
    _pageCurrent = [self.viewControlleres indexOfObject:pendingViewControllers[0]];
}

//上一个控制器销毁后
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
//    NSLog(@"%d",completed);
    if (!completed) return;//判断滚动是否成功
    
    
    if (_pageCurrent == 0) {
        [self changeLineX:20 + (80 - _lineW) / 2 brandBool:YES categoryBool:NO];
    }else if (_pageCurrent == 1){
        [self changeLineX:100 + (80 - _lineW) / 2  brandBool:NO categoryBool:YES];
    }
}


#pragma mark - 初始化数组
- (NSArray *)viewControlleres{
    if (!_viewControlleres) {
        MSBrandViewController *brandVc = [[MSBrandViewController alloc] init];
        MSCategoryController *cateVc = [[MSCategoryController alloc] init];
        _viewControlleres = @[cateVc,brandVc];
    }
    return _viewControlleres;
}


#pragma mark - 设置视图

- (UIPageViewController *)pageConVc{
    if (!_pageConVc) {
        _pageConVc = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageConVc.delegate = self;
        _pageConVc.dataSource = self;
    }
    return _pageConVc;
}

- (UIView *)titView{
    if (!_titView) {
        _titView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,200,44)];
        NSString *str = @"品牌";
        _lineW = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}].width;
        
       _brandBtn =  [self creatBtnTag:100 btnX:20 btnTitle:@"品类"];
        _brandBtn.selected = YES;
        [_titView addSubview:_brandBtn];
       _categoryBtn =  [self creatBtnTag:200 btnX:100 btnTitle:@"品牌"];
        [_titView addSubview:_categoryBtn];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake((80 - _lineW) / 2 + 20,40, _lineW, 2)];
        line.backgroundColor = [UIColor colorWithHex:0xff3b30];
        _line = line;
        [_titView addSubview:line];
        
    }
    return _titView;
}

#pragma mark -

- (void)titBtnAction:(UIButton *)btn{

    if (btn.tag == 200) {

       [self changeLineX:100 + (80 - _lineW) / 2 brandBool:NO categoryBool:YES];
        [self currentVcIndex:1];//显示的控制器
       
    }else{
       [self changeLineX:20 + (80 - _lineW) / 2  brandBool:YES categoryBool:NO];
       [self.pageConVc setViewControllers:@[self.viewControlleres[0]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
}

#pragma mark - 公共的调用方法
//更改线条的位置以及按钮的状态
- (void)changeLineX:(CGFloat)x brandBool:(BOOL)brand categoryBool:(BOOL)category{
    _brandBtn.selected = brand;
    _categoryBtn.selected = category;
    [UIView animateWithDuration:0.25 animations:^{
        _line.x = x;
    }];
    
}
//更改当前显示的视图
- (void)currentVcIndex:(NSInteger)vcIndex{
    //direction 视图改变时的方向 UIPageViewControllerNavigationDirectionForward从左向右
    [self.pageConVc setViewControllers:@[self.viewControlleres[vcIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}


//创建一个按钮
- (UIButton *)creatBtnTag:(NSInteger)btnTag btnX:(CGFloat)btnX btnTitle:(NSString *)btnTitle{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = btnTag;
    btn.frame = CGRectMake(btnX,7,80,30);
    [btn setTitleColor:[UIColor colorWithHex:0x474747] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithHex:0xff3b30] forState:UIControlStateSelected];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(titBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
    
    
}


@end
