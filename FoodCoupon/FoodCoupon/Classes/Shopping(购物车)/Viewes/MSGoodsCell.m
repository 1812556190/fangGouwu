//
//  MSGoodsCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSGoodsCell.h"
#import "PPNumberButton.h"

@interface MSGoodsCell ()
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn;
@property (weak, nonatomic) IBOutlet UIImageView *maxImage;
@property (weak, nonatomic) IBOutlet UILabel *goodsLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;

@property (weak, nonatomic) IBOutlet UIView *numBtnView;


@property (strong,nonatomic) PPNumberButton *numBtn;

@end


@implementation MSGoodsCell


- (void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    
    
     [self.numBtnView addSubview:self.numBtn];
    
    self.selectedBtn.selected = YES;
    
    __weak typeof(self) weakSelf = self;
    self.numBtn.numberBlock = ^(NSString *num){
        
        weakSelf.goodsLabel.text = [NSString stringWithFormat:@"卡乐比营养水果麦片800g/袋*%@",num];
        if ([weakSelf.goodsCellDelegate respondsToSelector:@selector(changeGoodsNumber:)]) {
            [weakSelf.goodsCellDelegate changeGoodsNumber:[num integerValue]];
        }
    };
    
}

#pragma mark - 加载设置视图

- (PPNumberButton *)numBtn{
    if (!_numBtn) {
        _numBtn = [[PPNumberButton alloc] initWithFrame:CGRectMake(0, 0,105, 35)];
        //设置边框颜色
        _numBtn.borderColor = [UIColor grayColor];

    }
    return _numBtn;
}






@end
