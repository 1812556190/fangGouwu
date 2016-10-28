//
//  MSTabCellBtn.m
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSTabCellBtn.h"
#import <Masonry.h>

@interface MSTabCellBtn ()

@property (nonatomic, strong)UIImageView *iconImage;

@property (nonatomic, strong)UILabel *centerTitle;

@property (nonatomic, strong)UILabel *bottomTitle;

@end

@implementation MSTabCellBtn


- (instancetype)initWithBtnImage:(NSString *)image btnCenterTit:(NSString *)tit{
     MSTabCellBtn *btn = [MSTabCellBtn buttonWithType:UIButtonTypeCustom];
    
    btn.iconImage.image = [UIImage imageNamed:image];
    btn.centerTitle.text = tit;
    
    return btn;
}


//实现set方法
- (void)setBottomText:(NSString *)bottomText{
    _bottomText = bottomText;
    self.bottomTitle.text = self.bottomText;
}

#pragma mark - 创建视图

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self addSubview:self.iconImage];
    [self addSubview:self.centerTitle];
    [self addSubview:self.bottomTitle];
   
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.centerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.iconImage.mas_bottom).offset(8);
        make.height.mas_equalTo(12);
    }];
    
    [self.bottomTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.centerTitle.mas_bottom).offset(5);
//        make.bottom.mas_equalTo(8);
    }];
    
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
        _iconImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImage;
}

-(UILabel *)centerTitle{
    if (!_centerTitle) {
        _centerTitle = [[UILabel alloc] init];
        _centerTitle.textAlignment = NSTextAlignmentCenter;
        _centerTitle.textColor = [UIColor colorWithHex:0x838383];
        _centerTitle.font = [UIFont systemFontOfSize:12];
    }
    return _centerTitle;
}

- (UILabel *)bottomTitle{
    if (!_bottomTitle) {
        _bottomTitle = [[UILabel alloc] init];
        _bottomTitle.textAlignment = NSTextAlignmentCenter;
        _bottomTitle.textColor = [UIColor colorWithHex:0xd6d6d6];
        _bottomTitle.font = [UIFont systemFontOfSize:9];
    }
    return _bottomTitle;
}



@end
