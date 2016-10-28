//
//  MSCartView.m
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSCartView.h"


#import <UIImage+GIF.h>

@interface MSCartView ()

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;


@end

@implementation MSCartView


//自定义初始化方法
- (instancetype)initWithLoadNibViewFrame:(CGRect)frame imageGif:(NSString *)gifName{
    
    //加载xib
    NSArray *cartViews = [[NSBundle mainBundle] loadNibNamed:@"MSCart" owner:nil options:nil];
    self = [cartViews lastObject];
    
    self.frame = frame;
    
    self.gifName = gifName;
    
    return self;
    
}



//重写set方法
- (void)setGifName:(NSString *)gifName{
    _gifName = gifName;
    
    //加载gif
    self.gifImageView.image = [UIImage sd_animatedGIFNamed:gifName];
    
}

#pragma mark - 按钮的点击事件

- (IBAction)goshoppingAction:(UIButton *)sender {
    
    if ([self.cartDelegate respondsToSelector:@selector(didSelectedAction:)]) {
        [self.cartDelegate didSelectedAction:sender];
    }
    
}






@end
