//
//  MSFooterCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSFooterCell.h"

@interface MSFooterCell ()
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;

@property (weak, nonatomic) IBOutlet UILabel *goodsInfo;
@property (weak, nonatomic) IBOutlet UIImageView *saleImage;

@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addCartBtn;

@end

@implementation MSFooterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    self.goodsPriceLabel.attributedText = [NSMutableAttributedString formattStrNorame:@"￥138 " crossOutStr:@"￥169 "];
    [self.goodsPriceLabel sizeToFit];
    
}
- (IBAction)addCartBtnAction:(UIButton *)sender {
    
    if ([self.footerDelegate respondsToSelector:@selector(didSelectAddCartBtn:)]) {
        [self.footerDelegate didSelectAddCartBtn:sender];
    }
}

@end
