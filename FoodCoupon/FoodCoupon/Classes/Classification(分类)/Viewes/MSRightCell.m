//
//  MSRightCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSRightCell.h"
#import "XSCycleBtn.h"

@interface MSRightCell ()<XSCycleBtnDelegate>


@property (strong, nonatomic)UIImageView *goodsImage;

@property (strong, nonatomic)UILabel *goodsName;

@property (strong, nonatomic)XSCycleBtn *btnView;



@end

@implementation MSRightCell



#pragma mark -  懒加载视图

- (UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc] init];
        _goodsImage.backgroundColor = [UIColor purpleColor];
    }
    return _goodsImage;
}


- (UILabel *)goodsName{
    if (!_goodsName) {
        _goodsName = [[UILabel alloc] init];
        
    }
    return _goodsName;
}


- (XSCycleBtn *)btnView{
    if (!_btnView) {
        _btnView = [[XSCycleBtn alloc] initWithBtnViewBtnHeight:30 btnViewFrame:CGRectMake(0,0,CATEGORYRIGTHWIDHT,100) btnLayoutNum:3 btnMargin:CGPointMake(0, 10)];
        _btnView.cycleDelegate = self;
    }
    return _btnView;
}


- (void)setBtnTitles:(NSArray *)btnTitles{
    _btnTitles = btnTitles;
    
    
    [self creatSubBtn];
    
    self.cellHeight = self.goodsImage.height + self.btnView.height + 10;
    
}



- (void)creatSubBtn{
    
    self.goodsImage.frame = CGRectMake(0, 0,CATEGORYRIGTHWIDHT,80);
    
    [self.contentView addSubview:self.goodsImage];
    
    self.btnView.y = self.goodsImage.height;
    self.btnView.btnTitles = self.btnTitles;
    for (UIButton *btn in self.btnView.buttones) {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    
    [self.contentView addSubview:self.btnView];
    

}

#pragma mark - XSCycleBtnDelegate
- (void)didSelectCycleBtnAction:(UIButton *)button{
    NSLog(@"点击按钮！");
}





@end
