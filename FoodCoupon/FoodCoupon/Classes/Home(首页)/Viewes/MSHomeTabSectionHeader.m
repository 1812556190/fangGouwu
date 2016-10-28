//
//  MSHomeTabSectionHeader.m
//  FoodCoupon
//
//  Created by apple on 16/10/20.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSHomeTabSectionHeader.h"
#import <Masonry.h>

#define HeaderHegith 40


@interface MSHomeTabSectionHeader ()

@property (strong, nonatomic) UILabel *titleLabe;

@property (strong, nonatomic) UILabel *subTitleLable;

@property (strong, nonatomic) UIView *lineView;



@end

@implementation MSHomeTabSectionHeader


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubView];
    }
    return self;
}

- (instancetype)initWithTabViewSectionHeaderViewTitle:(NSString *)title subTitle:(NSString *)subtitle{
    
    CGFloat hegith = subtitle  ? 50 : 65;
    
    self = [self initWithFrame:CGRectMake(0, 0, XSSREENWIDTH, hegith)];
 
    self.titleLabe.text = title;
    self.subTitleLable.text = subtitle;
    
    if (subtitle != nil) {
        [self.subTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabe.mas_bottom).offset(5);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(10);
        }];
    }
    return self;
}



- (void)loadSubView{
    
    [self addSubview:self.titleLabe];
    [self addSubview:self.subTitleLable];
    [self addSubview:self.lineView];
    
    [self.titleLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(15);
        make.height.mas_equalTo(15);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 2));
        make.bottom.mas_equalTo(- 10);
    }];

}



- (UILabel *)titleLabe{
    if (!_titleLabe) {
        _titleLabe = [[UILabel alloc] init];
        _titleLabe.font = [UIFont boldSystemFontOfSize:15];
        _titleLabe.textColor = [UIColor blackColor];
        _titleLabe.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabe;
}

- (UILabel *)subTitleLable{
    if (!_subTitleLable) {
        _subTitleLable = [[UILabel alloc] init];
        _subTitleLable.font = [UIFont systemFontOfSize:11];
        _subTitleLable.textColor = [UIColor colorWithHex:0xbcbcbc];
        _subTitleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _subTitleLable;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}


@end
