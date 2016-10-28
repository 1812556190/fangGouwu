//
//  MSBaseTableViewCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBaseTableViewCell.h"


@implementation MSBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initCell];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}


- (void)initCell{
    [self cellDidLoadSubView];
    [self cellDidAdjustAutoLayout];
}

- (void)cellDidLoadSubView{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


- (void)cellDidAdjustAutoLayout{
    
}

@end
