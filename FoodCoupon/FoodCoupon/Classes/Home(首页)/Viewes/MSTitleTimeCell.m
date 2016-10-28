//
//  MSBtnCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/20.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTitleTimeCell.h"
#import <UIImageView+WebCache.h>


@interface MSTitleTimeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

@property (strong, nonatomic) IBOutlet UIImageView *leftImage;

@property (strong, nonatomic) IBOutlet UILabel *leftLabel;


@property (strong, nonatomic) IBOutlet UILabel *rightLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;


@property (strong, nonatomic) NSTimer *timer;

@end

@implementation MSTitleTimeCell

-(void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.mainImage sd_setImageWithURL:[NSURL URLWithString:@"http://yangege.b0.upaiyun.com/11e47bbdfa98b.jpg"]];
    self.leftLabel.text = @"这是测试数据";
    self.rightLabel.text = @"这是一个鬼";
}


//定时器调用方法
- (void)timerAction{
    //?????
}


#pragma mark - 创建视图

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    }
    return _timer;
}





@end
