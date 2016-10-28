//
//  MSTabBarBtn.m
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTabBarBtn.h"

@interface MSTabBarBtn ()

@property (strong, nonatomic)UIScrollView *tabBarScrollView;

@end

@implementation MSTabBarBtn

- (instancetype)initWithTabBarBtnViewHeight:(CGFloat)height btnTitles:(NSArray<NSString *> *)titles{
    
  self = [self initWithFrame:CGRectMake(0, 0, XSSREENWIDTH, height)];
    
    
    
    return self;
}


- (UIScrollView *)tabBarScrollView{
    if (!_tabBarScrollView) {
        CGRect scrollViewFrame = self.frame;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
        scrollView.backgroundColor = [UIColor colorWithHex:0xffffff];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        _tabBarScrollView = scrollView;
    }
    return _tabBarScrollView;
}

//
//- (void)creatBtnes{
//    
//////    CGFloat btnW =
////    
////    self.tabBarScrollView.contentSize = CGSizeMake(, <#CGFloat height#>)
////    for (NSInteger i = 0; i < self.titles.count; i ++) {
////        
////    }
////    
////}





@end
