//
//  MSTitImageCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTitImageCell.h"
#import <UIImageView+WebCache.h>



#define CELLHEIGHT 200

#define CELLBOTTOMMargin 10

@interface MSTitImageCell ()



@property (strong, nonatomic) UIView *titView;

@property (strong, nonatomic) UIImageView *maxImage;

@property (strong, nonatomic) NSMutableArray *btnes;


@end

@implementation MSTitImageCell



//按钮数组
- (void)setBtnImagees:(NSArray *)btnImagees{
    _btnImagees = btnImagees;
    
    [self creatSubBtn];//加载所有的按钮
}


//显示图片
- (void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    
    [self.contentView addSubview:self.maxImage];
    [self.maxImage sd_setImageWithURL:[NSURL URLWithString:self.imageUrl]];
    [self.maxImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.width.equalTo(self.contentView.mas_width);
    }];
}


#pragma mark - 按钮点击事件
- (void)btnImageAction:(UIButton *)btn{
    
    NSLog(@"点击了按钮!");
    
}
#pragma mark - 创建视图

//显示图片的cell
- (UIImageView *)maxImage{
    if (!_maxImage) {
        _maxImage = [[UIImageView alloc] init];
        _maxImage.contentMode = UIViewContentModeScaleAspectFill;
        _maxImage.clipsToBounds = YES;
       

    }
    return _maxImage;
}


//按钮样式的cell
- (void)creatSubBtn{
    //解决循环创建按钮 BUG
    //将上一次的按钮全部移除 解决循环创建按钮
    if (self.btnes.count > 0) {
        for (UIButton *btn in self.btnes) {
            [btn removeFromSuperview];
        }
        [self.btnes removeAllObjects];
    }
    self.contentView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
    NSInteger count = self.btnImagees.count;
    for (NSInteger i = 0; i < count; i++) {
        NSInteger row = i % 4;
        NSInteger line = i / 4;
        CGFloat margin = 1;
        CGFloat w = (XSSREENWIDTH - margin * 3) / 4;
        CGFloat h = (CELLHEIGHT - CELLBOTTOMMargin - 3) / (count / 4);
        CGFloat x = row * w + row * margin;
        CGFloat y = line * h + line * margin + margin;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:self.btnImagees[i]] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blueColor];
        btn.frame = CGRectMake(x, y, w, h);
        btn.tag = i;
        [btn addTarget:self action:@selector(btnImageAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        [self.btnes addObject:btn];
    }
}

- (NSMutableArray *)btnes{
    if (!_btnes) {
        _btnes = [NSMutableArray array];
    }
    return _btnes;
}


@end
