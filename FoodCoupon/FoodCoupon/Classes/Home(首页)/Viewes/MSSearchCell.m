//
//  MSSearchCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSSearchCell.h"

#import "XSCycleBtn.h"

@interface MSSearchCell ()<XSCycleBtnDelegate>{
    UILabel *_titLable;
}

@property (strong, nonatomic) UIView *titView;

@property (strong, nonatomic) XSCycleBtn *btnView;

@end

@implementation MSSearchCell


#pragma mark - 按钮的点击事件


#pragma mark - XSCycleBtnDelegate
- (void)didSelectCycleBtnAction:(UIButton *)button{
    
    if ([self.searchCellDelegate respondsToSelector:@selector(didSelectCellBtn:)]) {
        [self.searchCellDelegate didSelectCellBtn:button];
    }
    
}


-(void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    
    self.contentView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
    
    self.separatorInset = UIEdgeInsetsZero;//设置分割线的偏移
    
    [self.contentView addSubview:self.titView];
}



- (void)setCellTitle:(NSString *)cellTitle{
    _cellTitle = cellTitle;
    
    _titLable.text = self.cellTitle;
}


- (void)setBtnTitles:(NSArray *)btnTitles{
    _btnTitles = btnTitles;
    
    [self creatSubBtn];
}




#pragma mark - 创建视图

- (UIView *)titView{
    if (!_titView) {
        _titView = [[UIView alloc] initWithFrame:CGRectMake(0, 20,XSSREENWIDTH,50)];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(18,5,3,20)];
        lineView.backgroundColor = [UIColor colorWithHex:0xf24839];
        lineView.layer.cornerRadius = 2;
        [_titView addSubview:lineView];
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25,5, XSSREENWIDTH - 25, 20)];
        label.textColor = [UIColor colorWithHex:0x505050];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.text = @"这是cell的标题";
        _titLable = label;
        
        [_titView addSubview:label];
    }
    return _titView;
}

- (XSCycleBtn *)btnView{
    if (!_btnView) {
        _btnView = [[XSCycleBtn alloc] initWithBtnViewBtnHeight:30 btnViewFrame:CGRectMake(0, 70,XSSREENWIDTH, 100) btnLayoutNum:5 btnMargin:CGPointMake(10, 10)];
        _btnView.cycleDelegate = self;
    }
    return _btnView;
}


- (void)creatSubBtn{

    self.btnView.btnTitles = self.btnTitles;
    [self.contentView addSubview:self.btnView];
    //设置属性
    for (UIButton *btn in self.btnView.buttones) {
        //设置边框圆角
        btn.layer.cornerRadius = 15.0;
        btn.layer.borderColor = [UIColor colorWithHex:0xe1e1e1].CGColor;
        btn.layer.borderWidth = 1.0;
    }
}


@end
